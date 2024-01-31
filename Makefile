release:
	$(eval version=$(shell head -n 1 VERSION))
	git checkout master
	git tag -a -m "Version $(version)" v$(version)
	git push --follow-tags