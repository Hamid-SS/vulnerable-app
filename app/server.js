const express = require('express');
const sqlite3 = require('sqlite3');
const app = express();
app.use(express.json());

// ❌ Zəiflik 1: SQL-injeksiya
app.get('/user/:id', (req, res) => {
    const db = new sqlite3.Database('./users.db');
    const query = `SELECT * FROM users WHERE id = ${req.params.id}`; // Dinamik string!
    db.get(query, (err, row) => {
        if (err) return res.status(500).send(err);
        res.json(row);
    });
});

// ❌ Zəiflik 2: XSS (reflected)
app.get('/search', (req, res) => {
    res.send(`<h1>Nəticə: ${req.query.q}</h1>`); // Heç nə təmizlənmir!
});

app.listen(3000, () => console.log('Server 3000 portunda'));
