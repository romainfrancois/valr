context("bed_makewindows")

genome <- dplyr::tibble(
  ~chrom, ~size,
  "chr1", 5000,
  "chr2", 400
)

bed_df <- dplyr::tibble(
  ~chrom, ~start, ~end, ~name,
  "chr1", 100, 200, 'A',
  "chr2", 300, 350, 'B'
) 

# Fixed number of windows 
res <- bed_makewindows(bed_df, genome, num_windows = 10)
#test_that('num_windows are correct', {
#  expect_that(nrow(res), 20)
#})

# Fixed window size
res <- bed_makewindows(bed_df, genome, win_size = 10)

# Fixed window size with overlaps
res <- bed_makewindows(bed_df, genome, win_size = 10, step_size = 5)

# Reversed window numbering
res <- bed_makewindows(bed_df, genome, win_size = 10, reverse = TRUE)