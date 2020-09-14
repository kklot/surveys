MICS <- R6::R6Class("MICS",
    public = list(
        initialize = function() {
            private$data = data.table::fread(private$meta)
        },
        in_label = function(what, show='all') {
            ids = grept(what, private$data$label, value=FALSE)
            if (show == 'all')
                private$data[ids, ]
            else
                private$data[ids, show]
        },
        in_name = function(what) {
            private$data[, grept(what, name)]
        }
    ),
    private = list(
        meta = system.file('extdata', 'MICS_meta_men_women.csv.bz2', package='surveys')
    ), 
    lock_objects = FALSE
)