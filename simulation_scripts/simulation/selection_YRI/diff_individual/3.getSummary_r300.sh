
inf="yri.id*.gz"

out="summary_r300.txt"
>${out}
for f in ${inf}
do
    echo "" >> ${out}
    echo ${f} >> ${out}
    perl ~/scct/getfre.pl ${f} 0.5 1 120 > temp.txt
    wc -l temp.txt >> ${out}
    tail -1 temp.txt >> ${out}
done