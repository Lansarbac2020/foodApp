//Gelistrici : Bacoro dit Elhadji Lansar
// Ogrenci No : B211200567
// Odev No : 3
// Odev Konusu : Siparis Planlama 
#include <algorithm>
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ctime>
#include <string>
#include <locale.h>

using namespace std;

struct bayi {
    string* adres;
    int bayiNo;
    int bayi;
    
};

int main() {
    setlocale(LC_ALL, "Turkish");
    int kalan_ürünler = 1000;
    bayi bayiler[10];
    // Her bayi için rastgele adresler oluşturun
    for (int i = 0; i < 10; i++) {
        string* adres = new string("Adres " + to_string(i));
        bayiler[i].adres = adres;
 }
    // Her bayi için rastgele siparişler oluşturun
    srand(time(0));
    for (int i = 0; i < 10; i++) {
        bayiler[i].bayiNo = i + 1;
        bayiler[i].bayi = rand() % 101;
        kalan_ürünler -= bayiler[i].bayi;
    }
    //Bayiler için rastgele gezim sırasını oluşturma
    int  gezim_sırası[10];
    for (int i = 0; i < 10; i++) {
        gezim_sırası[i] = i;
    }
    for (int i = 9; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = gezim_sırası[i];
        gezim_sırası[i] = gezim_sırası[j];
        gezim_sırası[j] = temp;
    }
    cout << "   " << endl;
    // siparisler.txt dosyasına sipariş yazdirma
    ofstream siparisler_file("siparisler.txt", ios::out);
    siparisler_file << "Bayilerin listesi, adresleri, telp edilen miktarları  :  " << endl;
    siparisler_file << "BayiNo" << "\t" << " Adresler " << "\t" << " telp sayi " << endl;
    for (int i = 0; i < 10; i++) {
        siparisler_file << bayiler[i].bayiNo << "\t" << bayiler[i].adres <<  "\t " << bayiler[i].bayi << endl;
    }
    //Rotalama sonucunda Bayi gezim sırasıni , adreslerini ve siparişlerini ekrana yazdırın
    cout << "Bayilerin listesi, adresleri, telp edilen miktarları  :  "  << endl;
    cout <<"BayiNo" << "\t " << " Adresler " << "\t" << "  telp sayi " << endl;
    // Bayi verilerinin rastgele kariştirilir 
    random_shuffle(&bayiler[0], &bayiler[10]);
    for (int i = 0; i < 10; i++) {
        cout << bayiler[i].bayiNo << "\t" << bayiler[i].adres << "\t" << bayiler[i].bayi << endl;
    }
    // Rotalama sonucunda Bayi gezim sırasıni , adreslerini ve siparişlerini "siparisler.txt" dosyasına sipariş yazdirma
    siparisler_file << "---------------------------" << endl;
    siparisler_file << " Belirlenen Dağıtım rotası : " << endl;
    siparisler_file << "---------------------------" << endl;
    siparisler_file << "BayiNo " << "\t" << " Adresler " << "\t" << " telp sayi " << endl;
    for (int i = 0; i < 10; i++) {
        siparisler_file << bayiler[i].bayiNo << "\t" << bayiler[i].adres << "   " << bayiler[i].bayi << endl;
    }
    siparisler_file << "****************************" << endl;
    // Şirketin deposunda kalan ürün miktarını siparisler.txt dosyasina yazdırma
    siparisler_file << " Depoda kalan ürünler : " << kalan_ürünler << endl;
    siparisler_file.close();
    cout << "****************************" << endl;
    // Şirketin deposunda kalan ürün miktarını yazdırma 
    cout << " Depoda kalan ürünler : " << kalan_ürünler << endl;
    return 0;
}