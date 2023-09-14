<?php

class Conexao
{
    private $host = 'maria-server';
    private $db = 'medfacil';
    private $user = 'root';
    private $password = '123';

    public function conectar()
    {
        try {
            $conexao = new PDO("mysql:host=$this->host;dbname=$this->db", $this->user, $this->password);
            return $conexao;
        } catch (PDOException $e) {
            echo $e;
        }
    }
}