mysql> delimiter //
mysql> create trigger wyzwalacz
    -> before insert on kreatura
    -> for each row
    -> begin
    -> if new.waga > 0 then
    -> signal sqlstate '45000'
    -> set message_text='waga<0';
    -> end if;
    -> end;
    -> //
Query OK, 0 rows affected (0.01 sec)
