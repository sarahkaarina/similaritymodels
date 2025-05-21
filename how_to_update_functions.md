For reference check out this link: https://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html

1) Open your package's R project R studio.
2) **Run** devtools::load_all()
3) Make any edits you need to the .R file which contain your functions
4) **After you made your changes**, run devtools::document()
   NB: NOT RUNNING devtools::document() will not update the function's usage in your package
   (to mean that while your .R will be edited, calling the function in R will still call its previous version if you haven't run step 4)
