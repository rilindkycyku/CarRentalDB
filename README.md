<h1 style="color: #0066cc; text-align: center;">CarRentalDB</h1>

<p style="font-size: 1.2em; text-align: center; color: #444;">
  <strong>Sistem Databaze i plotë për Sistemin e menaxhimit të qiradhënies së  Veturave me Qera</strong>
</p>

<p style="text-align: center;">
  <strong>Krijuar nga:</strong> Rilind Kyçyku & Perparim Dardhishta<br>
</p>

<hr style="border: 1px solid #0066cc; margin: 2em 0;">

<h2 style="color: #0055aa; border-bottom: 2px solid #0066cc; padding-bottom: 0.4em;">Përshkrimi i projektit</h2>
<p>
  Ky projekt është krijuar si pjesë e detyres në Sistemin e Bazës së të Dhënave.<br>
  Përfshin strukturën e databazës, të dhëna testuese, query të ndryshme, subquery dhe procedura të ruajtura.
</p>

<h2 style="color: #0055aa;">Entity-Relationship Diagram (ERD) dhe Modeli Tabelar</h2>

<img src="https://raw.githubusercontent.com/rilindkycyku/CarRentalDB/main/Dokumentimi/ERD.png" 
     alt="ERD - CarRentalDB" 
     style="max-width:100%; height:auto; border-radius:8px; box-shadow:0 4px 12px rgba(0,0,0,0.15); display:block; margin:0 auto 2em;">

<img src="https://raw.githubusercontent.com/rilindkycyku/CarRentalDB/main/Dokumentimi/MobeliTabelar.png" 
     alt="Modeli Tabelar - CarRentalDB" 
     style="max-width:100%; height:auto; border-radius:8px; box-shadow:0 4px 12px rgba(0,0,0,0.15); display:block; margin:0 auto 1.5em;">

<h2 style="color: #0055aa;">Teknologjitë</h2>
<ul style="line-height: 1.6;">
  <li>Microsoft SQL Server</li>
  <li>Python – Gjenerimi i te dhenave</li>
</ul>

<h2 style="color: #0055aa;">Struktura e projektit</h2>
<pre style="background: #f5f7fa; padding: 1.2em; border-radius: 8px; font-size: 0.95em; overflow-x: auto; color: black">
CarRentalDB/
├── Dokumentimi/            - Ketu gjenden pjesa e dokumentimit, ERD dhe Modeli Tabelar ne Draw.io
├── PythonScriptsInsert/    - Skriptat e perdorura per gjenerimin e te dhenave.
│
├── CarRental - DDL.sql
├── CarRental - DML (INSERT).sql
├── CarRental - DML (UPDATE).sql
├── CarRental - DML (DELETE).sql
└── CarRental - DML (Query, Subquery, Procedura te Ruajtura).sql
</pre>

<h2 style="color: #0055aa;">Si ta përdorni</h2>
<ol style="line-height: 1.7;">
  <li>Instaloni Microsoft SQL Server (Express – falas)</li>
  <li>Hapni SSMS</li>
  <li>Ekzekutoni skriptet me rradhë</li>
</ol>

<pre style="background: #f5f7fa; padding: 1.2em; border-radius: 8px; font-size: 0.95em; color: black">
-- 1. Struktura
CarRental - DDL.sql

-- 2. Të dhënat fillestare
CarRental - DML (INSERT).sql

-- 3. Test modifikimesh (opsionale)
CarRental - DML (UPDATE).sql
CarRental - DML (DELETE).sql

-- 4. Query & Procedurat
CarRental - DML (Query, Subquery, Procedura te Ruajtura).sql
</pre>
