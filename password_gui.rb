require 'tk'

# Embedded EFF wordlist (shortened here — paste your full list)
EFF_WORDLIST = [
  "abacus", "abdomen", "abdominal", "abide", "ability",
  "ablaze", "able", "abnormal", "abrasion", "absurd",
  "accent", "acclaim", "account", "accuracy", "acid",
  "acorn", "acre", "acrobat", "acting", "action"
]

def generate_passphrase(count)
  count = 4 if count <= 0
  EFF_WORDLIST.sample(count).join("-")
end

# --- GUI ---
root = TkRoot.new { title "Passphrase Generator" }

frame = TkFrame.new(root).pack(padx: 20, pady: 20)

# Label
TkLabel.new(frame) do
  text "Enter number of words:"
  pack
end

# Entry field
count_var = TkVariable.new
entry = TkEntry.new(frame) do
  textvariable count_var
  pack
end

# Result label
result_var = TkVariable.new
TkLabel.new(frame) do
  textvariable result_var
  font "Helvetica 14 bold"
  foreground "blue"
  wraplength 300
  pack(pady: 10)
end

# Button
TkButton.new(frame) do
  text "Generate Passphrase"
  command proc {
    count = count_var.value.to_i
    passphrase = generate_passphrase(count)
    result_var.value = passphrase
  }
  pack(pady: 10)
end

Tk.mainloop