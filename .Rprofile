if (interactive()) {
  suppressMessages(require(devtools))
}

# Handle packages not installed.
if (interactive() && getRversion() >= "4.0.0") {
  globalCallingHandlers(
    packageNotFoundError = function(err) {
      try(pak::handle_package_not_found(err))
    }
  )
}

# Warn on partial matches
options(
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE,
  warnPartialMatchArgs = TRUE
)

# Enable autocompletions for package names in
# `require()`, `library()`
utils::rc.settings(ipck = TRUE)
