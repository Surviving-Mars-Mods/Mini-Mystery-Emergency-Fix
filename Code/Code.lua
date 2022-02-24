-- See license.md for copyright info
SharedModEnv["FFL_Debug"] = true

local function Log(...)
    FFL_LogMessage(CurrentModDef.title, "code", ...)
end

function MiniMysteries:StartMiniMystery(mini_mystery_name, map_id, mini_mystery)
    if type(self.previous_mini_mysteries) ~= "table" then
        Log("ERROR", "Cannot start mini mystery!")
        return
    end

    CreateGameTimeThread(function()
        local seq_list = DataInstances.Scenario[mini_mystery_name]
        self.mini_mystery = mini_mystery
        RunSequenceList(seq_list, map_id)
        self.has_mini_mystery = false
        self.mini_mystery = false
        table.insert(self.previous_mini_mysteries, mini_mystery_name)
    end)
end