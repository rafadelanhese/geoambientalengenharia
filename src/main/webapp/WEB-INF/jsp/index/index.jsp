<%-- 
    Document   : index
    Created on : 11/09/2017, 20:09:12
    Author     : Rafael Delanhese
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Geoambiental Engenharia</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/site/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/site/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/site/css/agency.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">Geoambiental Engenharia</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav text-uppercase ml-auto">
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#services">Sobre Nós</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#portfolio">Portfólio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#servicos">Serviços</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#contact">Contato</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="${linkTo[LoginController].index}">Área Restrita</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
    <header class="masthead">
        <div class="container">
            <div class="intro-text">
                <div> <img src="${pageContext.request.contextPath}/site/img/logos/logoGeoambientalLetrasBrancas.png"
                        alt=""></div>
                <h3>ENGENHARIA CIVIL | AMBIENTAL | ARQUITETURA | TOPOGRAFIA</h3>
            </div>
        </div>
    </header>

    <!-- Services -->
    <section id="servicos">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading text-uppercase">Serviços</h2>
                    <h3 class="section-subheading text-muted">VEJA NOSSO KNOW-HOW EM CONSULTORIA</h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fas fa-circle fa-stack-2x text-primary"></i>
                        <i class="fas fa-plus fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Soluções Ambientais</h4>
                    <p class="text-muted">Assessoria, outorgas, licenciamento ambiental, gerenciamento de resíduos,
                        tratamentos de efluentesm EIA/RIMA e outros.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fas fa-circle fa-stack-2x text-primary"></i>
                        <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Geotecnologias</h4>
                    <p class="text-muted">Mapas temáticos em softwares de informações geográficas em imagens de
                        satélite, levantamento aéreo com VANT e DRONES.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fas fa-circle fa-stack-2x text-primary"></i>
                        <i class="fas fa-twitter fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Arquitetura e urbanismo</h4>
                    <p class="text-muted">Elaboração de projetos arquitetônicos comerciais, residenciaism clínicas,
                        urbanismo e modelagem 3D</p>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fas fa-circle fa-stack-2x text-primary"></i>
                        <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Perícia ambiental</h4>
                    <p class="text-muted">Acompanhamento técnico, laudos técnicos ambientais.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fas fa-circle fa-stack-2x text-primary"></i>
                        <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Topografia e Agrimenssura</h4>
                    <p class="text-muted">Levantamento planialtimétrico, georreferenciamento de imóveis rurais,
                        desmembramento, retificação de matrículas de imóveis.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fas fa-circle fa-stack-2x text-primary"></i>
                        <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="service-heading">Arquitetura e urbanismo</h4>
                    <p class="text-muted">Elaboração de projetos arquitetônicos comerciais, residenciaism clínicas,
                        urbanismo e modelagem 3D</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Portfolio Grid -->
    <section class="bg-light" id="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading text-uppercase">Portfólio</h2>
                    <h3 class="section-subheading text-muted">Nossos últimos projetos.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioIpiranga">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/ipiranga-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Ipiranga</h4>
                        <p class="text-muted">Postos de combustíveis</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/tratamentoefluentes-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Geoambiental</h4>
                        <p class="text-muted">Estação de tratamentos de efluentes compacta</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal3">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/tenisclube-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Tênis Clube Presidente Prudente</h4>
                        <p class="text-muted">Clube de lazer</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal4">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/cartonagemfernandez-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Cartonagem Fernandez</h4>
                        <p class="text-muted">Encadernação</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal5">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/supergasbras-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>SuperGasbras</h4>
                        <p class="text-muted">Gás</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/mastercountry-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Master Country Fivelas</h4>
                        <p class="text-muted">Artigos country</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/multibrasil-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Multibrasil Sementes</h4>
                        <p class="text-muted">Sementes</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/hospitalbernardes-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Hospital de Presidente Bernardes</h4>
                        <p class="text-muted">Saúde pública</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/prefeituranarandiba-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Prfeeitura Municipal de Narandiba</h4>
                        <p class="text-muted">Órgão Público</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/unoeste-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Unoeste</h4>
                        <p class="text-muted">Ensino superior</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/pulverizacao-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Perícia Ambiental</h4>
                        <p class="text-muted">Deriva de pulverização aérea</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/energisa-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Energisa</h4>
                        <p class="text-muted">Iluminação pública</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/martville-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Residencial Martville</h4>
                        <p class="text-muted">Residencial</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/oasis-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Condomínio Oásis do Paranapanema</h4>
                        <p class="text-muted">Condomínio</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/residuos-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Gerenciamento de Resíduos</h4>
                        <p class="text-muted">Serviços de Saúde</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/car-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Cadastro Ambiental Rural</h4>
                        <p class="text-muted">CAR</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/reflorestamento-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Projetos de Reflorestamento</h4>
                        <p class="text-muted">Reflorestamento</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/incendioflorestal-thumbnail.jpg"
                            alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>Perícia Ambiental</h4>
                        <p class="text-muted">Incêndio Florestal</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About -->
    <section id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading text-uppercase">About</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="timeline">
                        <li>
                            <div class="timeline-image">
                                <img class="rounded-circle img-fluid" src="${pageContext.request.contextPath}/site/img/about/1.jpg"
                                    alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>2009-2011</h4>
                                    <h4 class="subheading">Our Humble Beginnings</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                        Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam,
                                        recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium
                                        consectetur!</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="rounded-circle img-fluid" src="${pageContext.request.contextPath}/site/img/about/2.jpg"
                                    alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>March 2011</h4>
                                    <h4 class="subheading">An Agency is Born</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                        Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam,
                                        recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium
                                        consectetur!</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="timeline-image">
                                <img class="rounded-circle img-fluid" src="${pageContext.request.contextPath}/site/img/about/3.jpg"
                                    alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>December 2012</h4>
                                    <h4 class="subheading">Transition to Full Service</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                        Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam,
                                        recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium
                                        consectetur!</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="rounded-circle img-fluid" src="${pageContext.request.contextPath}/site/img/about/4.jpg"
                                    alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>July 2014</h4>
                                    <h4 class="subheading">Phase Two Expansion</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                        Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam,
                                        recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium
                                        consectetur!</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <h4>Be Part
                                    <br>Of Our
                                    <br>Story!</h4>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>       

    <!-- Contact -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading text-uppercase">Contato</h2>
                    <h3 class="section-subheading text-muted">Entre em contato conosco e solicite um orçamento.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <form id="contactForm" name="sentMessage" novalidate="novalidate">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input class="form-control" id="name" type="text" placeholder="Nome" required="required"
                                        data-validation-required-message="Por favor insira seu nome.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id="email" type="email" placeholder="E-mail" required="required"
                                        data-validation-required-message="Por favor insira seu e-mail.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id="phone" type="tel" placeholder="Celular" required="required"
                                        data-validation-required-message="Por favor insira seu celular.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" id="message" placeholder="Digite sua mensagem"
                                        required="required" data-validation-required-message="Por favor escreva uma mensagem."></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase" type="submit">Enviar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; Geoambiental Engenharia</span>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li class="list-inline-item">
                            <a href="#">
                                <i class="fab fa-twitter"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li class="list-inline-item">
                            <a href="#">Privacy Policy</a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">Terms of Use</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <!-- Portfolio Modals -->

    <!-- Modal 1 -->
    <div class="portfolio-modal modal fade" id="portfolioIpiranga" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl"></div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 mx-auto">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2 class="text-uppercase">Ipiranga</h2>
                                <p class="item-intro text-muted">Postos de combustíveis</p>                                
                                <p>Fomos responsáveis pela renovação de licença de operação junto à CETESB, Companhia Ambiental do Estado de São Paulo 
                                    da base de combustível da IPIRANGA S/A, localizada no município de Presidente Prudente - SP. Além disso, monitoramos
                                    o cumprimento das exigências técnicas contidas na licença da operação.
                                </p>                                
                                <button class="btn btn-primary" data-dismiss="modal" type="button">
                                    <i class="fas fa-times"></i>
                                    Fechar Projeto</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    

    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/site/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/site/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/site/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact form JavaScript -->
    <script src="${pageContext.request.contextPath}/site/js/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath}/site/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="${pageContext.request.contextPath}/site/js/agency.min.js"></script>

</body>

</html>