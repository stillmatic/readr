get_cache_dir <- function() {
  path <- file.path("~", "ds_cache")
  if(!dir.exists(path)) {
    dir.create(path)
  }
  return(path)
}

hash_query <- function(query) {
  return(digest::sha1(query))
}

exists_in_cache <- function(key) {
  return(file.exists(file.path(get_cache_dir(), key)))
}

save_to_cache <- function(df, key) {
  path <- file.path(get_cache_dir(), key)
  write(paste0("saving to cache at ", Sys.time()), file = stdout())
  saveRDS(df, path)
}

read_from_cache <- function(key) {
  path <- file.path(get_cache_dir(), key)
  write(paste0("reading from cache created at ", Sys.time()), file = stdout())
  return(readRDS(path))
}
