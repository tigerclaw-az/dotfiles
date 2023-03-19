packages=(@angular/cli @prettier/plugin-php @vue/cli audiosprite gulp prettier
	eslint sass-lint typescript yarn);

for p in "${packages[@]}"
	do
		npm install -g $p
		echo "\t${p}\n"
		if [ $? != 0 ]; then
			echo "\t\033[31mFAILED -> ${p}\033[0m"
		else
			echo "\t\033[32mSUCCESS\033[0m"
		fi
	done
