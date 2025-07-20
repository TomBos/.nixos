for file in "./exports/"*; do
	if [[ -f "$file" ]]; then
		source "$file"
	fi
done

