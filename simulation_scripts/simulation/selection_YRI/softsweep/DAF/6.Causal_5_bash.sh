# Compute power for each window length.

#inf="std.ratio.id*.gz"

p=(0.291666 0.291666 0.291666 0.291666)
ss=(`cat ../para.sh`)
out="causal_5.txt"
echo ">${out}"
for((i=0;i<${#ss[@]};i++)){

    echo "echo ${ss[i]} >> ${out}"
    echo "zcat yri_ceu.daf.${ss[i]}.gz | node ~/scct/LocateCausalSite.js 25 ${p[i]} 8 0.5000000000 1 4 5 >>${out}"
    echo "echo '' >> ${out}"

}
