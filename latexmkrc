@default_files = ('cv.tex', 'resume.tex');
$pdf_mode = 5;
$dvi_mode =
$postscript_mode = 0;
$bibtex_use = 2;
$pdf_previewer = 'evince';
$xelatex = 'xelatex --shell-escape -halt-on-error -interaction=batchmode %O %S';
$success_cmd = 'rm -rf svg-inkscape/';
@generated_exts = qw(aux xdv fls log out);