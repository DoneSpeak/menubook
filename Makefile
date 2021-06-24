install-husky-hooks: 
ifeq ($(wildcard .husky/_/husky.sh),)
	npx husky install
endif
ifeq ($(wildcard ~/.huskyrc),)
	ln -s $(PWD)/.huskyrc ~/.huskyrc
else
	@echo "Fail: ~/.huskyrc already exist, please handle it manually."
endif
ifeq ($(wildcard .gitignore),)
	touch .gitignore
endif
ifeq ($(shell grep -c .husky/customized .husky/.gitignore),0)
	echo "\n# 忽略.husky/customized中开发人员自定义脚本\n.husky/customized" >> .husky/.gitignore
endif
