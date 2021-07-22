## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(AvInertia)

## ----load_data----------------------------------------------------------------
data(dat_id_curr, package = "AvInertia")
data(dat_bird_curr, package = "AvInertia")
data(dat_feat_curr, package = "AvInertia")
data(dat_bone_curr, package = "AvInertia")
data(dat_mat, package = "AvInertia")
data(clean_pts, package = "AvInertia")

## ----calc_torso---------------------------------------------------------------
dat_torsotail_out = massprop_restbody(dat_id_curr, dat_bird_curr)

## ----calc_feat----------------------------------------------------------------
feather_inertia <- compute_feat_inertia(dat_mat, dat_feat_curr, dat_bird_curr)

## ----calc_wing_noplot---------------------------------------------------------
dat_wing_out      = massprop_birdwing(dat_id_curr, dat_bird_curr, dat_bone_curr, dat_feat_curr, dat_mat, clean_pts, feather_inertia, plot_var = 0)

## ----calc_wing_plotxy, fig.width = 4------------------------------------------
dat_wing_out      = massprop_birdwing(dat_id_curr, dat_bird_curr, dat_bone_curr, dat_feat_curr, dat_mat, clean_pts, feather_inertia, plot_var = "yx")

## ----calc_wing_plotyz, fig.width = 4------------------------------------------
dat_wing_out      = massprop_birdwing(dat_id_curr, dat_bird_curr, dat_bone_curr, dat_feat_curr, dat_mat, clean_pts, feather_inertia, plot_var = "yz")

## ----combine_prop-------------------------------------------------------------
curr_full_bird      = combine_inertialprop(dat_torsotail_out,dat_wing_out,dat_wing_out, dat_id_curr, dat_bird_curr, symmetric=TRUE)

