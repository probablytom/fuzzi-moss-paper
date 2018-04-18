slides:
	pandoc -s --mathjax --from markdown+fenced_divs -t revealjs -V theme=white -V center=false  presentation.md -o presentation.html


