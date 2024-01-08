(lang dune 3.0)

(name sarif)

(generate_opam_files true)

(source
 (github gborough/sarif))

(authors "Geoffrey Borough")

(maintainers "geoffrey.borough@outlook.com")

(license MIT)

(homepage "https://github.com/gborough/sarif")

(bug_reports "https://github.com/gborough/sarif/issues")

(documentation "https://gborough.github.io/sarif/sarif")

(package
 (name sarif)
 (synopsis "Static Analysis Results Interchange Format (SARIF) Version 2.1.0")
 (description "Static Analysis Results Interchange Format (SARIF) Version 2.1.0")
 (depends (ocaml (>= 4.14.0)) dune core re2 atdgen-runtime timedesc ppx_jane ppx_deriving (uri (>= 4.4.0)))
 (tags
  (sarif)))