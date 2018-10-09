#! /usr/bin/env bash
cwd=`pwd`
echo 'bokeh-0.12.7' > $cwd/requirements.txt

repos=`find . -name .git -type f`
for repo in $repos
do 
    echo $repo
    repo_dir=${repo%.git}
    echo $repo_dir

    cd $cwd
    cp -R $repo_dir/* $cwd/dist/
    if [[ -f $repo_dir/requirements.txt ]]; then
        cat $repo_dir/requirements.txt >> $cwd/requirements.txt
    fi

done
cat $cwd/requirements.txt > dist/requirements.txt
rm dist/oca_dependencies.txt
rm dist/README.md
