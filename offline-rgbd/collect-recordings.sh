if [ $# -ne 1 ]; then
    echo Usage $0 session name
    exit 1
fi
sessionname=$1

mkdir ${sessionname}
for remote in dis@disnuc101.local dis@disnuc103.local dis@disnuc202.local dis@disnuc301.local iti-nuc@iti-nuc-01.local iti-nuc@iti-nuc-02.local iti-nuc@iti-nuc-03.local iti-nuc@iti-nuc-04.local; do
    scp -i ~/.ssh/id_disnuc ${remote}:*.mkv ${sessionname}/
    scp -i ~/.ssh/id_disnuc ${remote}:*_error.txt ${sessionname}/
done