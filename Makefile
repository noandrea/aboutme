CV_MARKDOWN_URL = 'https://hackmd.io/WpaEphBpSJSWCU_dDe-IrQ/download'
CV_FONT_DIR     = $(HOME)/.fonts/IBM-Plex-Mono
CV_FONT         = IBMPlexMono
#CV_FONT_DIR     = $(HOME)/.fonts/InputMono/$(CV_FONT)
CV_FONT_EXT     = .ttf
CV_FONT_REGULAR = *-Regular
CV_FONT_BOLD    = *-Bold
CV_FONT_ITALIC  = *-Italic
CV_OUTFILE      = ./assets/AndreaGiacobino.CV.pdf

#  --table-of-contents

cv:
	@echo preparing cv
	curl -s -L $(CV_MARKDOWN_URL) -o /tmp/cv.md
	pandoc /tmp/cv.md -o $(CV_OUTFILE) \
  --pdf-engine=xelatex \
  --indented-code-classes=javascript \
  --highlight-style=monochrome \
  -V 'mainfont:$(CV_FONT)' \
  -V 'mainfontoptions:Extension=$(CV_FONT_EXT), UprightFont=$(CV_FONT_REGULAR), BoldFont=$(CV_FONT_BOLD), ItalicFont=$(CV_FONT_ITALIC), Path=$(CV_FONT_DIR)/'
	xdg-open $(CV_OUTFILE)
