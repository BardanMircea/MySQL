create database entreprise ; 
use entreprise ; 

create table departement(
dno int primary key,
dnom varchar(255),
dir int, 
ville varchar(255)
); 

create table employe (
eno int primary key,
enom varchar(255),
prof varchar(255),
dateemb date,
sal int,
comm int,
dno int,
foreign key(dno) references departement(dno)
); 

insert into employe values(10, "Joe", "Ingenieur", "1993-10-01", 4000, 3000, 3),
(20, "Jack", "Technicien", "1988-05-01", 3000, 2000, 2),
(30, "Jim", "Vendeur", "1980-03-01", 5000, 5000, 1),
(40, "Lucy", "Ingenieur", "1980-03-01", 5000, 5000, 3);

insert into employe values(50, "Julien", "Technicien", "1993-11-01", 4000, 3000, 3); 
insert into employe values(60, "Julie", "Vendeur", "1990-11-01", 5500, 3000, 1);

INSERT INTO departement VALUES(1, "Commercial", 30, "New York"),
(2, "Production", 20, "Houston"),
(3, "Developpement", 40, "Boston");
INSERT INTO departement VALUES(4, "Informatique", 102, "New York");

-- afficher les éléments en Employés et Départements
select * from  employe ; 
select * from  departement ; 
select * from employe natural join departement ; 
-- Donnez les noms des employés et les noms de leur département
select enom as nom, dnom as nom_departement from employe, departement where employe.dno = departement.dno ; 
select enom as nom, dnom as nom_departement from employe inner join departement on employe.dno = departement.dno ; 
-- Donnez les numéros des employés travaillant à Boston
select eno, enom from employe inner join departement on employe.dno = departement.dno where ville = 'boston' ; 
-- Donnez les noms des directeurs de département 1 et 3
select enom, dir from employe inner join departement on employe.eno = departement.dir where departement.dno in (1,3) ;
select enom, dir from employe inner join departement on employe.dno = departement.dno where departement.dno in (1,3) and dir=eno ;
-- Donnez les noms des employés travaillant dans un département avec au moins un ingénieur
select enom from employe where dno in (select distinct employe.dno from employe where employe.prof = 'ingenieur') ; 
-- Donnez le salaire et le nom des employés gagnant plus qu'un (au moins un) ingénieur
select enom, sal from employe where sal > (select sal from employe where prof = 'Ingenieur' order by sal limit 1) and prof != 'Ingenieur'; 
select enom, sal from employe where sal > (select min(sal) from employe where prof = 'Ingenieur') and prof != 'Ingenieur';
select e1.enom as nom, e1.sal as salaire from employe e1, employe e2 where e1.sal > e2.sal and e2.prof ='Ingenieur'; 
-- Donnez les salaire et le nom des employés gagnant plus que tous les ingénieurs
select enom, sal from employe where sal > (select sal from employe where prof = 'Ingenieur' order by sal desc limit 1) and prof != 'Ingenieur'; 
select enom, sal from employe where sal > (select max(sal) from employe where prof = 'Ingenieur') and prof != 'Ingenieur';
select e1.enom as nom, e1.sal as salaire from employe e1, employe e2, employe where e1.sal > e2.sal and e2.prof ='Ingenieur'; 
-- Donnez les noms des employés et les noms de leur directeur.
select e1.enom as employe , e2.enom as directeur from employe e1, employe e2, departement d where e1.dno = d.dno and e2.eno = d.dir and e1.enom != e2.enom ;
 
select employe.enom , directeur.enom from employe 
inner join departement on departement.dno = employe.dno 
inner join employe directeur on departement.dir = directeur.eno where employe.enom != directeur.enom ; 

-- Trouvez les noms des employés ayant le même directeur que JIM
select employe.enom
from employe 
where employe.dno in (select departement.dno from departement, employe where departement.dno = employe.dno and employe.enom = 'Jim') and enom != 'JIM';

select enom from employe where dno in (select dno from departement where dir in (select eno from employe where enom ='JIM')) and enom != 'JIM' ;


-- Donnez le nom et la date d'embauche des employés embauchés avant leur directeur; donnez également le nom et la date d'embauche du dit directeur
select e1.enom as employes, e2.enom as directeur , e1.dateemb as dateemb_employe , e2.dateemb as dateemb_directeur 
from employe e1, employe e2, departement d 
where e1.dno = d.dno and e2.eno = d.dir and e1.dateemb < e2.dateemb ; 

update employe 
set dateemb = '1991-01-01' where enom = 'Jim' ; 

select *
from
(select enom, eno, dateemb, employe.dno  from employe , departement where employe.dno = departement.dno and employe.eno != departement.dir) as a,
(select enom, eno, dateemb, employe.dno  from employe , departement where employe.dno = departement.dno and employe.eno = departement.dir) as b
where a.dateemb < b.dateemb
and a.dno=b.dno;

-- Donnez les départements qui n'ont pas d'employés
select departement.dnom from departement left join employe on departement.dno = employe.dno where employe.dno is null ; 
select dnom from departement where dno not in (select dno from employe) ; 
-- Donnez les noms des employés du département commercial embauchés le même jour qu'un employé du département Production
select e1.enom  ,e1.dateemb , d.dnom
from  employe e1
 inner join departement d on d.dno = e1.dno and (d.dnom in ( 'Commercial' ,'Developpement')) 
 and e1.Dateemb = (select dateemb from employe group by dateemb having count(*) > 1)  ;

select e1.enom from employe e1, employe e2, departement d1, departement d2
where e1.dno = d1.dno 
and e2.dno = d2.dno 
and d1.dnom = 'Commercial'
and d2.dnom = 'Developpement'
and e1.dateemb = e2.dateemb ; 

select e1.enom from employe e1, employe e2
where e1.dno = (Select dno from departement
				where dnom = "Commercial")
and e2.dno = (Select dno from departement
				where dnom = "developpement")
and e1.dateemb = e2.dateemb;

-- Donnez les noms des employés embauchés avant tous les employés du département 1.
select enom from employe where dateemb < all (select dateemb from employe where dno= 1) ;
select enom from employe where dateemb < (select min(dateemb) from employe where dno= 1) ;
-- Donnez les noms des employés ayant le même emploi et le même directeur que JOE.
update employe
set prof = 'Ingenieur' where enom = 'Julien'; 

select 
	Employe.enom
--    Employes.prof,
--    Employes.dno
    -- Employes.dateemb
from Employe
where (Employe.prof, Employe.dno) = (
select Employe.prof, Employe.dno from Employe where Employe.enom = 'Joe');

select 
	Employe.enom
--    Employes.prof,
--    Employes.dno
    -- Employes.dateemb
from Employe
where Employe.prof = (select Employe.prof from Employe where Employe.enom = 'Joe') 
and 
Employe.dno = (select Employe.dno from Employe where Employe.enom = 'Joe');

