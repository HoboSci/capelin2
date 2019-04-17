modelmonth <- cbind(paste0(mthna ,unique(prback$year)))
aicetc <- read.csv("../data/env/AICcCalculations.csv", header = TRUE) #pre-created csv file
betavallist <- cbind(aicetc$regularization)
nfolds <- cbind(c(1:5))

for (year in 1:nrow(modelmonth)){
  timeslice <- modelmonth[year] #testing timeslice
  yr <- str_sub(timeslice, -4) #the year being used for testing
  train <- subset(prback, year == yr) #training data is all years but testing
  trainpa <- train$occurrence #creates a vector of presence/background ID (1/0)
  train  <- subset(train, select = -c(year, occurrence)) #don't need year and occurrence for modelling
  
  for (h in 1:nrow(betavallist)){
    betamval <-  betavallist[h]
    mod <- maxent(x = train, p = trainpa, args=c("maximumiterations=5000", "responsecurves=TRUE", "jackknife=TRUE", "threads=8", "addsamplestobackground=TRUE", paste0("replicates=", nfolds), "replicatetype=crossvalidate", paste0("betamultiplier=", betavallist[h])), path = paste0("../output/maxent/models/", timeslice)) #here the full path is needed
    
    #now based on glover-kapfer pdf with excel manual + https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/10-1171.1... + adaptation for        getting testAUC.. horrible code
    
    maxresults <- read.csv(paste0("../output/maxent/p2/models/", timeslice, "/maxentResults.csv"), header = TRUE)
    
    
    #count number of non-zero coefficients, excluding the final four rows
    lambdas_list <- list.files(paste0("../output/maxent/p2/models/", timeslice), pattern = "*lambdas", full.names = TRUE)
    samppred_list <- list.files(paste0("../output/maxent/p2/models/", timeslice), pattern = "*samplePredictions.csv", full.names = TRUE)
    for(f in 1:length(nfolds)){
      fn <- f
      modn <- fn-1
      lamf <- lambdas_list[f]
      sampf <- samppred_list[f]
      coefile <- read.csv(paste0(lamf), header = FALSE, stringsAsFactors=FALSE)
      coefile <- head(coefile, -4)
      coefile2 <- subset(coefile, V2 != 0)
      nocoeff <- nrow(coefile2)
      bick <- sum(as.numeric(coefile2[, 2])) #dodgy 
      bic <- (bick*log(sum(trainpa == 1)) - 2*11) #dodgy
      #natural log
      samplepred <- read.csv(paste0(sampf), header = TRUE)
      samplepred$nat_log <- log(samplepred$Raw.prediction)
      sumsamplepred <- sum(samplepred$nat_log)
    }
    
    
    
    #no presences used in model (less those used for testing)
    
    notrainingpoints <- maxresults$X.Training.samples[fold]
    testauc <- maxresults$Test.AUC[fold]
    trainauc <- maxresults$Training.AUC[fold]
    modno <- maxresults$Species[fold]
    
    
    
    
    
    
    
    #test auc scores and other lovely things you might want to include
    # ev <- evaluate(p = testp, a= testb, model = mod)
    #evauc <- ev@auc
    #evcor <- ev@cor
    #evpcor <- ev@pcor
    #evnp <- ev@np
    #evna <- ev@na
    #evmaxtprtnr <- threshold(ev, 'spec_sens')
    #evmaxkap <- threshold(ev, 'kappa')
    #evno_omission <- threshold(ev, 'no_omission')
    #evprevalence <- threshold(ev, 'prevalence')
    #evequal_sens_spec <- threshold(ev, 'equal_sens_spec')
    #evsensitivity <- threshold(ev, 'sensitivity')
    
    
    aicetc$train_AUC <- trainauc
    aicetc$test_AIC <- testauc
    aicetc$no_trainng_points <- notrainingpoints
    aicetc$test_coefficients <- nocoeff
    aicetc$test_sum.of.logs <- sumsamplepred
    #aicetc$test_AUC <- evauc
    #aicetc$test_evcor <- evcor
    # aicetc$test_evpcor <- evpcor
    # aicetc$test_nopresence <- evnp
    # aicetc$test_nobackground <- evna
    # aicetc$test_maxsumsenspec <- evmaxtprtnr
    # aicetc$test_maxkap <- evmaxkap
    # aicetc$test_no_omission <- evno_omission
    # aicetc$test_prevalence <- evprevalence
    # aicetc$test_equal_sens_spec <- evequal_sens_spec
    # aicetc$test_sensitivity <- evsensitivity
    aicetc$test_bic <- bic #not sure this is correct...
    aicetc$beta <- betaval
    
    aicetc$AIC <- ((2*aicetc$coefficients)-(2*aicetc$sum.of.logs))
    aicetc$AICc <- (-2*(aicetc$sum.of.logs)+((2*aicetc$coefficients)*(aicetc$n/(aicetc$n - aicetc$coefficients-1))))
    
    #calculate minimal predicted area using ecospat
    aicetc$mpa_0.9_cum <- ecospat.mpa(samplepred$Cumulative.prediction, perc = 0.9) #90%
    
    aicetc$AIC <- ((2*aicetc$coefficients)-(2*aicetc$sum.of.logs))
    aicetc$AICc <- (-2*(aicetc$sum.of.logs)+((2*aicetc$coefficients)*(aicetc$n/(aicetc$n - aicetc$coefficients-1))))
    write.csv(aicetc, paste0("../output/maxent/p2/models/", timeslice, "/", modn, "AICforMaxentReg.csv"), row.names = FALSE)
  }
}
}
