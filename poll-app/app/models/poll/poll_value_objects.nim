
type PollId* = ref object
    value: string

func new*(_:type PollId, value:string): PollId =
  PollId(
    value: value
  )

proc `$`*(self: PollId): string = 
    return self.value


type SelectItem* = ref object
    value: string

func new*(_:type SelectItem, value: string): SelectItem =
    SelectItem(
        value: value
    )    

proc `$`*(self: SelectItem): string = 
    return self.value

