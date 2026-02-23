import 'dart:io';

void main() {

stdout.write('nom client:');
String nomClient = stdin.readLineSync()!;

stdout.write('grossiste (oui ou non): ');
String grossiste = stdin.readLineSync()!;

stdout.write('paiement comptant (oui ou non): ');
String paiementComptant = stdin.readLineSync()!;

stdout.write('vente emportée (oui ou non): ');
String venteEmportee = stdin.readLineSync()!;

stdout.write('marchandise HT: ');
double marchandiseHT = double.parse(stdin.readLineSync()!);

double remise1 = 0;
if (grossiste == 'oui') {
  remise1 = marchandiseHT * 0.02;
} else {
  remise1 = 0;
}
double total1 = marchandiseHT - remise1;

double remise2 = 0;
if (grossiste == "oui" && total1 > 10000) {
  remise2 = total1 * 0.05;
} else {
  remise2 = 0;
}
double total2 = total1 - remise2;

double escompte = 0;
if (paiementComptant == 'oui' && grossiste == 'oui') {
  escompte = total2 * 0.03;
}
double totalHT = total2 - escompte;

double tva = totalHT * 0.20;
double totalTTC = totalHT + tva;
double fdp = 0;
if (venteEmportee == 'oui') {
  // vente emportée -> pas de frais de port
  fdp = 0;
} else {
  fdp = 0.5;
}
double np = totalTTC + fdp;

print('''
=========================================
nom client         : $nomClient
grossiste          : $grossiste
paiement comptant  : $paiementComptant
vente emportée     : $venteEmportee
----------------------------------------
marchandise HT     : $marchandiseHT
remise 1           : $remise1
remise 2           : $remise2
total 1            : $total1
total 2            : $total2
escompte           : $escompte
total HT           : $totalHT
TVA                : $tva
total TTC          : $totalTTC
frais de port      : $fdp
net à payer        : $np
=========================================
''');


}  