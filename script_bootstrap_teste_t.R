# ***********************************************
# script para fazer testes de t em bootstrap
# ******************************* E.M. 03/04/15 *


library(WRS)

# testes proteina A vs. B para diferentes variaveis

# 1. Dinamometria final

din_A <- c(20.5, NA, 21.4, 22.7, 17.9, NA, 46.8)
din_B <- c(36.8, NA, 49.2, 27.8, NA)

dinamo_A_x_B <- yuenbt(din_A, din_B, tr=.0, alpha=.05, nboot = 1000, side = T)

dinamo_A_x_B

# 2. Caminhada final

cam_A <- c(471, NA, 459.4, 436, NA, NA, 420)
cam_B <- c(436, NA, 540, 409.2, 399)

caminha_A_x_B <- yuenbt(cam_A, cam_B, tr=.0, alpha=.05, nboot = 1000, side = T)

caminha_A_x_B

# 3. IL6

il6_A <- c(0, NA, 0, 4.11, 0, NA, NA)
il6_B <- c(0, NA, 0, 0, NA)

il6_A_x_B <- yuenbt(il6_A, il6_B, tr=.0, alpha=.05, nboot = 1000, side = T)

il6_A_x_B

# 4. IL10

il10_A <- c(3.35, NA, 1.71, 2.14, 0, NA, NA)
il10_B <- c(0, NA, 4.12, 0, NA)

il10_A_x_B <- yuenbt(il10_A, il10_B, tr=.0, alpha=.05, nboot = 1000, side = T)

il10_A_x_B

# testes inicial x final para cada proteina

# 6. dinamometria inicial x final

# prot A
din_Ai <- c(20.3, 25.9, 20.1, 21.8, 15.4, 16.4, 39.5)
din_Af <- c(20.5, NA, 21.4, 22.7, 17.9, NA, 46.8)

dinamo_Ai_x_Af <- yuenbt(din_Ai, din_Af, tr=.0, alpha=.05, nboot = 1000, side = T)

dinamo_Ai_x_Af

# prot B
din_Bi <- c(44.9, 6.7, 32.6, 18.1, 40.3)
din_Bf <- c(36.8, NA, 49.2, 27.8, NA)

dinamo_Bi_x_Bf <- yuenbt(din_Bi, din_Bf, tr=.0, alpha=.05, nboot = 1000, side = T)

dinamo_Bi_x_Bf

# 7. caminhada inicial x final

# prot A
cam_Ai <- c(275.1, 390.9, 439.2, 410.4, 431.9, 228.4, 502.6)
cam_Af <- c(471, NA, 459.4, 436, NA, NA, 420)

caminha_Ai_x_Af <- yuenbt(cam_Ai, cam_Af, tr=.0, alpha=.05, nboot = 1000, side = T)

caminha_Ai_x_Af

# prot B
cam_Bi <- c(517.5, NA, 503.5, NA, 383.7)
cam_Bf <- c(436, NA, 540, 409.2, 399)

caminha_Bi_x_Bf <- yuenbt(cam_Bi, cam_Bf, tr=.0, alpha=.05, nboot = 1000, side = T)

caminha_Bi_x_Bf

# 8. IL6 inicial x final

# prot A
il6_Ai <- c(16.5, 0, 0, NA, 8.4, 7.2, NA)
il6_Af <- c(0, NA, 0, 4.1, 0, NA, NA)

il6_Ai_x_Af <- yuenbt(il6_Ai, il6_Af, tr=.0, alpha=.05, nboot = 1000, side = T)

il6_Ai_x_Af

# prot B
il6_Bi <- c(0, NA, 70.5, 5.6, 0)
il6_Bf <- c(0, NA, 0, 0, NA)

il6_Bi_x_Bf <- yuenbt(il6_Bi, il6_Bf, tr=.0, alpha=.05, nboot = 1000, side = T)

il6_Bi_x_Bf

# 9. IL10 inicial x final

# prot A
il10_Ai <- c(0, 1.4, 2.4, NA, 0, 2, NA)
il10_Af <- c(3.4, NA, 1.7, 2.1, 0, NA, NA)

il10_Ai_x_Af <- yuenbt(il10_Ai, il10_Af, tr=.0, alpha=.05, nboot = 1000, side = T)

il10_Ai_x_Af

# prot B
il10_Bi <- c(0, NA, 1.4, 0, 0)
il10_Bf <- c(0, NA, 4.1, 0, NA)

il10_Bi_x_Bf <- yuenbt(il10_Bi, il10_Bf, tr=.0, alpha=.05, nboot = 1000, side = T)

il10_Bi_x_Bf





