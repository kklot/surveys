# survey(s)

Collection of surveys meta data such as variable name, label, file name, etc. and provides a R6 class interface to interact with the meta data, mainly query variable names.

## Install 

```r
remotes::install_github('kklot/surveys')
library(survey)
```

# Usage

Generate a new `surveys` object, only MICS women and men metadata is here now.

```r
mics <- MICS$new()
```

List meta data variables

```r
mics$variables()
```

Tabulate

```r
mics$table('sex')
```

Find rows match pattern in a varable, extract dataset's variable name

```r
mics$find_in_col(col='sex', what='female', show = 'name')
```

Find in label by regex pattern, optionally extract a column, default to using `perl` for advanced queries such as look ahead.

```r
mics$find_in_label(what='^(?!ever|reason).*ever had sex', show='label')
```

Find in survey's variables name by regex pattern.

```r
mics$find_in_name('00')
```

# How to contributes

- Add, update metadata in the `inst/extdata`
- Add more info by adding more columns to the data
- Add methods for existing class and new class

TODO:

- [ ] DHS
- [ ] AIS
- [ ] PHIA
- [ ] HSRC
- [ ] GHS
- [ ] AIIS
- [ ] PHS
- [ ] FHS
- [ ] HBSC
- [ ] HFD
- [ ] HMD
- [ ] NSFG
- [ ] PEPFAR
- [ ] ESS
- [ ] census
- [ ] add here if you know
