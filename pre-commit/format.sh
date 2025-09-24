while IFS= LC_ALL=C read -r -d '' -u 9 file
do
    if [[ "$file" == *.sql ]]; then
        echo "processing sql file: $file"
        cat $file | sqlformat > $file.tmp
        mv $file.tmp $file
    else
        echo "skipping file: $file"
    fi
done 9< <( find . -type f -exec printf '%s\0' {} + )