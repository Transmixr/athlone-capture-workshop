set -x
for remote in dis@disnuc101.local dis@disnuc103.local dis@disnuc202.local dis@disnuc301.local iti-nuc@iti-nuc-01.local iti-nuc@iti-nuc-02.local iti-nuc@iti-nuc-03.local iti-nuc@iti-nuc-04.local; do
    ssh -i ~/.ssh/id_disnuc ${remote} del "*.mkv"
    ssh -i ~/.ssh/id_disnuc ${remote} del "*.bag"
    ssh -i ~/.ssh/id_disnuc ${remote} del "*_error.txt"
done