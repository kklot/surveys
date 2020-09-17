MICS <- R6::R6Class("MICS",
    public = list(
        initialize = function() {
            private$data = data.table::fread(private$meta)
        },
        variables = function() {
            colnames(private$data)
        }, 
        find_in_col = function(col, what, show='all') {
            if (length(col)>1) stop('Can not search all mutiple columns yet.')
            ids = grept(what, private$data[, col], value=FALSE, perl=TRUE)
            if (show == 'all')
                private$data[ids, ]
            else
                private$data[ids, show]
        },
        find_in_label = function(what, show='all') {
            ids = grept(what, private$data$label, value=FALSE, perl=TRUE)
            if (show == 'all')
                private$data[ids, ]
            else
                private$data[ids, show]
        },
        find_in_name = function(what, show='all') {
            ids = grept(what, private$data$name, value=FALSE, perl=TRUE)
            if (show == 'all')
                private$data[ids, ]
            else
                private$data[ids, show]
        },
        table = function(what) {
            stopifnot(length(what) == 1)
            table(private$data[, what], useNA='a')
        }
    ),
    private = list(
        data = NULL,
        meta = system.file('extdata', 'MICS_meta_men_women.csv.bz2', package='surveys'),
        var_exist = function(var) {
            # add this into show...
            all(var %in% colnames(data))
        }
    ), 
    lock_objects = FALSE
)