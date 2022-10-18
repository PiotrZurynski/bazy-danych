// deltaas.cpp : Ten plik zawiera funkcję „main”. W nim rozpoczyna się i kończy wykonywanie programu.
//

#include <iostream>

using namespace std;

int main()
{
    cout << "Wyliczanie delty\n";

    int a = 2; int b = -8; int c = 4;

    cout << "a=" << a << "b=" << b << "c=" << c << endl;
     
    int Delta = (b * b) - 4 * a * c;

    cout << "delta=" << Delta << endl;

    if (Delta < 0)
    {

        cout << "to nie jest równanie kwadratowe" << endl;
        return 1;
    }
    
        double x1 = (-b - sqrt(Delta)) / (2 * a);
        double x2 = (-b + sqrt(Delta)) / (2 * a);
    
    cout << "x1=" << x1 << "x2=" << x2 << endl;

}

// Uruchomienie programu: Ctrl + F5 lub menu Debugowanie > Uruchom bez debugowania
// Debugowanie programu: F5 lub menu Debugowanie > Rozpocznij debugowanie

// Porady dotyczące rozpoczynania pracy:
//   1. Użyj okna Eksploratora rozwiązań, aby dodać pliki i zarządzać nimi
//   2. Użyj okna programu Team Explorer, aby nawiązać połączenie z kontrolą źródła
//   3. Użyj okna Dane wyjściowe, aby sprawdzić dane wyjściowe kompilacji i inne komunikaty
//   4. Użyj okna Lista błędów, aby zobaczyć błędy
//   5. Wybierz pozycję Projekt > Dodaj nowy element, aby utworzyć nowe pliki kodu, lub wybierz pozycję Projekt > Dodaj istniejący element, aby dodać istniejące pliku kodu do projektu
//   6. Aby w przyszłości ponownie otworzyć ten projekt, przejdź do pozycji Plik > Otwórz > Projekt i wybierz plik sln
