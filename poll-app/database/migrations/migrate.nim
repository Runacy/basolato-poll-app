import asyncdispatch
import migration_poll_select

proc main() =
  discard
  waitFor poll_select()

main()
