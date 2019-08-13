echo "→ Please write the dependency package to the requirements.txt"
read -r -p "[Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
        mkdir python
        pip install -r requirements.txt --target ./python
        find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf
        zip -r python.zip python/
        rm -rf python
        echo "→ You can upload the python.zip to AWS Lambda Layers"
		;;
    [nN][oO]|[nN])
		echo "EXIT."
        exit 1
       		;;
    *)
	echo "Invalid input..."
	exit 1
	;;
esac