# Simulate the demography model of YRI.

# Ne = 100000, u = 1.5 * 10^-8, r = 1.3 * 10^-8. L = 3m.
# theta = 4*Ne*u*L = 4*100000*1.5*10^-8*3*10^6 = 18000
# p = 4*Ne*r*L = 4 * 100000 * 1.3 * 10^-8 * 3 * 10^6 = 15600

# AF expansion:
# 200g/(4*100000) = 0.0005
# Ne_Africa_before expansion 24000 = 0.24

# EU expansion:
# 350/(4*100000) = 0.000875
# Ne_European_before expansion 7700 = 0.077

# EU out of africa: 3500/(4*100000) = 0.00875

# African ancestral expansion:
# 17000/(4*100000) = 0.0425
# Ne_before expansion: 12500 = 0.125

# YRI bottleneck:
# Time: 1500g - 2500g: 0.00375 - 0.00625
# Coefficient 0.5 0.1 0.01

ss="0.5 0.1 0.01"
for s in ${ss}
do
    b=`echo "${s}*0.24" | bc -l`

    echo "java -jar -Xmx30G ~/scct/msms.jar 240 300 -t 18000 -r 15600 -N 100000 -I 2 120 120 -en 0.0005 1 0.24 -en 0.00375 1 0${b} -en 0.00625 1 0.24 -en 0.000875 2 0.077 -ej 0.00875 2 1 -en 0.0425 1 0.125 -threads 15 | gzip > AFR_CEU.bot.${s}.gz"
done
