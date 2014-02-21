# Compute power for DAF

#inf="std.ratio.id*.gz"

#p=(0.316667 0.291666 0.272222 0.258333 0.25 0.241667 0.235714)
cv=(8 7 7 6 6 6)
ss=(`seq 30 30 180`)
out="power_0.3.txt"
echo ">${out}"

for((i=0;i<${#ss[@]};i++)){

    echo "echo ${ss[i]} >> ${out}"
    echo "zcat yri_ceu.daf.id${ss[i]}.gz |  node ~/scct/PowerCaculation.js 25 0.3  ${cv[i]} 0.5000000000 1 4 >>${out}"
    echo "echo '' >> ${out}"

}
