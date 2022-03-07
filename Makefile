install-husky-hooks: 
ifeq ($(wildcard .husky/_/husky.sh),)
# 如果没有安装husky，安装husky
	npx husky install
endif
ifeq ($(wildcard ~/.huskyrc),)
# 如果没有～/.huskyrc, 则创建为项目根目录的～/.huskyrc
	ln -s $(PWD)/.huskyrc ~/.huskyrc
else
	@echo "Fail: ~/.huskyrc already exist, please handle it manually."
endif
ifeq ($(wildcard .gitignore),)
# 如果没有.gitignore文件，则创建
	touch .gitignore
endif
ifeq ($(shell grep -c /customized .husky/.gitignore),0)
	echo "\n# 忽略.husky/customized中开发人员自定义脚本\n/customized" >> .husky/.gitignore
endif
