mysql> select kreatura.nazwa from kreatura where idkreatury not in (select id_uczestnika from uczestnicy);
+----------+
| nazwa    |
+----------+
| Brutal   |
| Defgard  |
| Ara      |
| Gollum   |
| Babajaga |
+----------+
5 rows in set (0.00 sec)


mysql> select wyprawa.nazwa, sum(ekwipunek.ilosc) as zebrane_ilosci from wyprawa inner join uczestnicy on uczestnicy.id_wyprawy=wyprawa.id_wyprawy inner join kreatura on kreatura.idkreatury=uczestnicy.id_uczestnika inner join ekwipunek on ekwipunek.idkreatury=kreatura.idkreatury group by wyprawa.nazwa;
+-----------------------+----------------+
| nazwa                 | zebrane_ilosci |
+-----------------------+----------------+
| Polowanie na tesciowa |             68 |
| Nakarm kanibala       |             84 |
| Poszukiwanie ziecia   |              5 |
+-----------------------+----------------+
3 rows in set (0.00 sec)



mysql> select wyprawa.nazwa, count(uczestnicy.id_uczestnika), group_concat(kreatura.nazwa) from wyprawa inner join uczestnicy on uczestnicy.id_wyprawy=wyprawa.id_wyprawy inner join kreatura on kreatura.idkreatury=uczestnicy.id_uczestnika group by wyprawa.nazwa ;
+-----------------------+---------------------------------+----------------------------------------------------------------+
| nazwa                 | count(uczestnicy.id_uczestnika) | group_concat(kreatura.nazwa)                                   |
+-----------------------+---------------------------------+----------------------------------------------------------------+
| Nakarm kanibala       |                               6 | Bjorn,Khorad,Astrid,Dziadek,Bjolkolur,Drozd                    |
| Polowanie na tesciowa |                               7 | Bjorn,Dziadek,Szczeki,Drozd,Loko,Ibra,Birgun                   |
| Poszukiwanie ziecia   |                               5 | Nemo,Tesciowa,Tiki,sztuczna szczeka tesciowej,Tesciowa dziadka |
+-----------------------+---------------------------------+----------------------------------------------------------------+
3 rows in set (0.00 sec)




mysql> select etapy_wyprawy.idetapu,etapy_wyprawy.idwyprawy,sektor.nazwa,kreatura.nazwa from etapy_wyprawy inner join sektor on sektor.id_sektora=etapy_wyprawy.sektor inner join wyprawa on etapy_wyprawy.idwyprawy=wyprawa.id_wyprawy inner join uczestnicy on uczestnicy.id_wyprawy=wyprawa.id_wyprawy inner join kreatura on kreatura.idkreatury=uczestnicy.id_uczestnika where  wyprawa.kierownik=kreatura.idkreatury order by wyprawa.data_rozpoczecia ,etapy_wyprawy.kolejnosc asc;
+---------+-----------+--------------------+----------+
| idetapu | idwyprawy | nazwa              | nazwa    |
+---------+-----------+--------------------+----------+
|       1 |         1 | Pieczara tesciowej | Tesciowa |
|      11 |         3 | Chatka dziadka     | Dziadek  |
|       2 |         1 | Wulkan             | Tesciowa |
|      12 |         3 | Pieczara tesciowej | Dziadek  |
|       3 |         1 | Wioska Kanibali    | Tesciowa |
|      13 |         3 | Zatoka rekinow     | Dziadek  |
|       4 |         1 | Pieprzne pole      | Tesciowa |
|      14 |         3 | Wulkan             | Dziadek  |
|       5 |         1 | Chatka dziadka     | Tesciowa |
|      15 |         3 | Wioska Kanibali    | Dziadek  |
|       6 |         2 | Kokosowa plaza     | Bjorn    |
|       7 |         2 | Chatka dziadka     | Bjorn    |
|       8 |         2 | Wulkan             | Bjorn    |
|       9 |         2 | Zatoka rekinow     | Bjorn    |
|      10 |         2 | Pieczara tesciowej | Bjorn    |
+---------+-----------+--------------------+----------+
15 rows in set (0.01 sec)


mysql> select count(sektor),sektor.nazwa from sektor left join etapy_wyprawy on etapy_wyprawy.sektor=sektor.id_sektora group by nazwa;
+---------------+--------------------+
| count(sektor) | nazwa              |
+---------------+--------------------+
|             2 | Wioska Kanibali    |
|             0 | Zabojcza skala     |
|             0 | Magiczna jaskinia  |
|             1 | Pieprzne pole      |
|             3 | Wulkan             |
|             3 | Pieczara tesciowej |
|             3 | Chatka dziadka     |
|             1 | Kokosowa plaza     |
|             2 | Zatoka rekinow     |
+---------------+--------------------+
9 rows in set (0.00 sec)



mysql> select kreatura.nazwa, if(uczestnicy.id_uczestnika>0, 'bral udzial w wyprawie', 'nie bral udzialu w wyprawie') as udzial from kreatura left join  uczestnicy on kreatura.idkreatury=uczestnicy.id_uczestnika group by kreatura.nazwa;
+----------------------------+-----------------------------+
| nazwa                      | udzial                      |
+----------------------------+-----------------------------+
| Bjorn                      | bral udzial w wyprawie      |
| Brutal                     | nie bral udzialu w wyprawie |
| Khorad                     | bral udzial w wyprawie      |
| Birgun                     | bral udzial w wyprawie      |
| Defgard                    | nie bral udzialu w wyprawie |
| Astrid                     | bral udzial w wyprawie      |
| Ibra                       | bral udzial w wyprawie      |
| Bjolkolur                  | bral udzial w wyprawie      |
| Nemo                       | bral udzial w wyprawie      |
| Loko                       | bral udzial w wyprawie      |
| Drozd                      | bral udzial w wyprawie      |
| Ara                        | nie bral udzialu w wyprawie |
| Szczeki                    | bral udzial w wyprawie      |
| Tesciowa                   | bral udzial w wyprawie      |
| Tiki                       | bral udzial w wyprawie      |
| Dziadek                    | bral udzial w wyprawie      |
| sztuczna szczeka tesciowej | bral udzial w wyprawie      |
| Tesciowa dziadka           | bral udzial w wyprawie      |
| Gollum                     | nie bral udzialu w wyprawie |
| Babajaga                   | nie bral udzialu w wyprawie |
+----------------------------+-----------------------------+
20 rows in set (0.00 sec)


mysql> select wyprawa.nazwa,sum(char_length(etapy_wyprawy.dziennik))as liczba_znakow from wyprawa inne
 sum(char_length(etapy_wyprawy.dziennik))<400 ;
+-----------------------+---------------+
| nazwa                 | liczba_znakow |
+-----------------------+---------------+
| Poszukiwanie ziecia   |           344 |
| Polowanie na tesciowa |           310 |
+-----------------------+---------------+
2 rows in set (0.00 sec)


mysql> select wyprawa.nazwa, (SUM(zasob.waga*ekwipunek.ilosc))/count(uczestnicy.id_uczestnika) as srednia_waga_zasobu_noszonego from wyprawa joi
n uczestnicy on wyprawa.id_wyprawy=uczestnicy.id_wyprawy join ekwipunek on uczestnicy.id_uczestnika=ekwipunek.idkreatury join zasob on ekwipunek.idzasobu=zasob.idzasobu group by wyprawa.nazwa;
+-----------------------+-------------------------------+
| nazwa                 | srednia_waga_zasobu_noszonego |
+-----------------------+-------------------------------+
| Nakarm kanibala       |                      5.364286 |
| Polowanie na tesciowa |                      9.427273 |
| Poszukiwanie ziecia   |                      3.500000 |
+-----------------------+-------------------------------+
3 rows in set (0.00 sec)


mysql> select kreatura.nazwa, datediff(wyprawa.data_rozpoczecia,kreatura.dataur) as wiek_w_dniach from kreatura join uczestnicy on uczestnicy.id_uczestnika=kreatura.idkreatury join wyprawa on uczestnicy.id_wyprawy=wyprawa.id_wyprawy join etapy_wyprawy on wyprawa.id_wyprawy=etapy_wyprawy.
idwyprawy join sektor on etapy_wyprawy.sektor=sektor.id_sektora where sektor.nazwa='chatka dziadka' group by kreatura.nazwa;
+----------------------------+---------------+
| nazwa                      | wiek_w_dniach |
+----------------------------+---------------+
| Bjorn                      |         11080 |
| Khorad                     |         10610 |
| Birgun                     |          9216 |
| Astrid                     |          8384 |
| Ibra                       |          9678 |
| Bjolkolur                  |          8890 |
| Nemo                       |          8339 |
| Loko                       |          8338 |
| Drozd                      |          9157 |
| Szczeki                    |          9616 |
| Tesciowa                   |         16376 |
| Tiki                       |         10220 |
| Dziadek                    |         20279 |
| sztuczna szczeka tesciowej |          7293 |
| Tesciowa dziadka           |         25661 |
+----------------------------+---------------+
15 rows in set (0.01 sec)

