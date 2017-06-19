$files = Get-ChildItem ".\dot\*.dot" -Recurse
foreach($file in $files) 
{
    $destination_path = $file.DirectoryName.Replace("\dot\","\img\") + "\" + $file.BaseName + ".tex"
    $new_file = New-Item $destination_path -Force
    dot2tex --figonly --prog=dot -t math -ftikz -o $new_file -e utf8 $file
}

#pdflatex.exe -synctex=1 -interaction=nonstopmode main.tex
