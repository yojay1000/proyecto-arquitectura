const express = require('express');
const router = express.Router();
const connection=require('../database/db')
const bcryptjs=require('bcryptjs');

//rutas
router.get('/', (req, res) => {
    if(req.session.loggedin){
        res.render('index', {
        titulo: 'inicio',
        loggedin:true,
        nombre:req.session.nombre,
        rol:req.session.rol
        })
    }else{
        res.render('index', {
            titulo: 'inicio',
            loggedin:false,
            nombre:'',
            rol:''
        })
    }
    
})

router.get('/contacto', (req, res) => {
    if(req.session.loggedin){
        res.render('contacto', {
        titulo: 'inicio',
        loggedin:true,
        nombre:req.session.nombre,
        rol:req.session.rol
        })
    }else{
        res.render('contacto', {
            titulo: 'inicio',
            loggedin:false,
            nombre:'',
            rol:''
        })
    }
    
})
router.get('/cliente', (req, res) => {
    if(req.session.loggedin&&req.session.rol=='cliente'){
        connection.query('SELECT * FROM reparaciones_pendientes WHERE id_cliente= ?;SELECT * FROM vehiculos;SELECT * FROM lista_reparaciones',[req.session.id_cliente],(error,results)=>{
        if(error)throw error;
        var arrvehiculos = {};results[1].map((obj)=>{arrvehiculos[obj.id_vehiculo] = obj.placa+" "+obj.marca+" "+obj.modelo;});   
        // var arrlista = {};results[1].map((obj)=>{arrlista[obj.titulo_lista] = obj.descripcion;});   

        res.render('cliente', {
            titulo: 'mi perfil',
            rol:req.session.rol,
            loggedin:true,
            nombre:req.session.nombre,
            reparaciones:results[0],
            vehiculos:arrvehiculos,
        })
    })
    }else{
        res.redirect('/')
    }
    
})
router.get('/servicios', (req, res) => {
    if(req.session.loggedin){
        res.render('servicios', {
        titulo: 'servicios',
        loggedin:true,
        nombre:req.session.nombre,
        rol:req.session.rol
        })
    }else{
        res.render('servicios', {
            titulo: 'servicios',
            loggedin:false,
            nombre:'',
            rol:''
        })
    }
    
})
router.get('/login', (req, res) => {
    res.render('login', {
        titulo: 'login',
        rol:''
    })
})

router.get('/registro', (req, res) => {
    res.render('registro', {
        titulo: 'registro',
        rol:''
    })
})
//rutas post



module.exports = router;