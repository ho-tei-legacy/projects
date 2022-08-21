# Geplantes format in .txt datei:
# Chemie: ;2;4;5
# Mathe: ;1;1;1

# Output:
# Chemie: 3,7
# Mathe: 1,0
#
# Gesamt: 2,3

f = open("Noten.txt", "r")
gesamtNoten = 0
gesamtNotenAnzahl = 0
for x in f:
    noten = x.split(";")
    gesamtNotenAnzahl += len(noten)-1
    totalGrades = 0
    for i in range(1, len(noten)):
        totalGrades += int(noten[i])
        gesamtNoten += int(noten[i])

    print(noten[0] + str(totalGrades/(len(noten)-1)))
print("\nGesamt: " + str(gesamtNoten/gesamtNotenAnzahl))
        