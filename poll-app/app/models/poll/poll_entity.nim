import poll_value_objects


type Poll* = ref object
  pollId*: PollId 
  selectItem*: SelectItem

proc new*(_:type Poll, pollId: PollId, selectItem: SelectItem):Poll =
  return Poll(
    pollId: pollId,
    selectItem: selectItem
  )
