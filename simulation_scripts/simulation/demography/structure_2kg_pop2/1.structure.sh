# Simulate the structure model of YRI.

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

# 2pop substructure of YRI population.
# Time: 0g - 2000g: 0 - 0.005
# Migration coefficient between sub-pop, 0 10 100.
# 0.24/2 = 0.12

ss=`cat para.sh`
for s in ${ss}
do
    #b=`echo "${s}*0.24" | bc -l`

    echo "java -jar -Xmx30G ~/scct/msms.jar 240 300 -t 18000 -r 15600 -N 100000 -I 3 60 60 120 ${s} -m 1 3 0 -m 3 1 0 -m 2 3 0 -m 3 2 0 -en 0 1 0.5 -en 0 2 0.5 -en 0.0005 1 0.12 -en 0.0005 2 0.12 -ej 0.005 2 1 -en 0.005 1 0.24 -en 0.000875 3 0.077 -ej 0.00875 3 1 -en 0.0425 1 0.125 -threads 15 | gzip > AFR_CEU.sub.${s}.gz"
done
