#!/usr/bin/R

# Comment describing what this script does, and how long it should take.

Analyze <- function(strain_data, gap_size, model) {
  cat("Analyzing data for", gap_size, "mm gap...")
  # Setup the data.
  split_data <- MakeGap(strain_data, gap_size)
  # Training data
  d.strain <- Dataset(id="steel.strain", data=split_data$data,
    X.names=c("X", "Y"), column="exx", data.offset=0)
  # Testing data (true data inside the gap)
  d.gap <- Dataset(id="gap.points", data=split_data$gap,
    X.names=c("X", "Y"), column="exx", data.offset=0)

  # Train the model on the non-gap data.
  model$Train(d=d.strain, force.retrain=TRUE)
  gap_results <- model$PosteriorInterval(d=d.strain, X.out=d.gap$X)

  cat("done!\n")
  return (list(data=d.strain, gap=d.gap, predicted=gap_results))
}

MakeGap <- function(strain_data, gap_size) {
  condition <- pmax(abs(strain_data$X), abs(strain_data$Y)) > gap_size * 0.5
  return (list(
      data=strain_data[which(condition), ],
      gap=strain_data[which(!condition), ]))
}

flag_gap <- '.varying_gap_last_ran_at'
modified_time <- file.info("./run_me_once.R")$mtime
gap_info <- file.info(flag_gap)
rerun_varying_gap_sizes <- (is.na(gap_info) || gap_info$mtime < modified_time)

if (rerun_varying_gap_sizes) {

  library(gppois)
  data(steelStrain)
  steelStrainAll <- rbind(steelStrain, steelStrainGap)

  # Setup a Model which will be shared among all gap sizes.  (The model will be
  # re-trained for each gap size, but starting from the previous solution; I
  # hope this approach speeds convergence.)
  M <- Model(id="steel")
  ell.bounds <- c(0.1, 10)
  sigma.f.relative <- c(0.1, 10)
  sigma.n.bounds <- diff(range(steelStrainAll$exx)) * c(1e-7, 1e-3)
  Cov.2d <- CovarianceSEAniso2D(id="signal", theta.1=0,
    ell.1.bounds=ell.bounds, ell.2.bounds=ell.bounds,
    sigma.f.bounds=sigma.f.relative * sd(steelStrainAll$exx))
  M$AddCovariance(Cov.2d)
  M$SetNoiseBounds(sigma.n.bounds)

  results <- list()
  for (i in seq(from=6, to=3, by=-0.5)) {
    cat("\n", date(), "\n")
    results[sprintf("%.1f", i)] <- list(Analyze(steelStrainAll, i, M))
  }
  save(results, file='custom/results.RO')

  # We just need to save *anything* here.
  xyz <- 123
  save(xyz, file=flag_gap)

}

flag_surface <- '.surface'
surface_info <- file.info(flag_surface)
rerun_surface <- (is.na(surface_info) || surface_info$mtime < modified_time)

if (rerun_surface) {

  library(gppois)
  data(steelStrain)

  d.strain <- Dataset(id="steel.strain", data=steelStrain, X.names=c("X", "Y"),
    column="exx", data.offset=0)
  d.gap <- Dataset(id="gap.points", data=steelStrainGap, X.names=c("X", "Y"),
    column="exx", data.offset=0)
  M.aniso <- Model(id="aniso")
  ell.bounds <- c(0.1, 10)
  sigma.f.relative <- c(0.1, 10)
  sigma.n.bounds <- diff(range(d.strain$dpts)) * c(1e-7, 1e-3)
  Cov.2d <- CovarianceSEAniso2D(id="signal", theta.1=0,
    ell.1.bounds=ell.bounds, ell.2.bounds=ell.bounds,
    sigma.f.bounds=sigma.f.relative * sd(d.strain$dpts))
  M.aniso$AddCovariance(Cov.2d)
  M.aniso$SetNoiseBounds(sigma.n.bounds)
  M.aniso$Train(d=d.strain)

  # Save the file for speedy access later.
  x.gap.surface <- GriddedConvexHull(X=d.gap$X, spacing=0.2)
  save(x.gap.surface, d.strain, d.gap, M.aniso, file='custom/trained.RO')

  # We just need to save *anything* here.
  xyz <- 123
  save(xyz, file=flag_surface)

}

