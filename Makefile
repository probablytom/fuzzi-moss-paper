slides:
	pandoc -s --mathjax --from markdown+fenced_divs -i -t revealjs -V theme=white  presentation.md -o presentation.html


