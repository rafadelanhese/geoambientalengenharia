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
                        <a class="portfolio-link" data-toggle="modal" href="#modalIpiranga">
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
                        <a class="portfolio-link" data-toggle="modal" href="#modalTenisClube">
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
                        <a class="portfolio-link" data-toggle="modal" href="#modalSupergasBras">
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
                        <a class="portfolio-link" data-toggle="modal" href="#modalMasterFivelas">
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
                        <a class="portfolio-link" data-toggle="modal" href="#modalMultibrasilSementes">
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
                        <a class="portfolio-link" data-toggle="modal" href="#modalHospitalBernardes">
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
                            <h4>Prefeitura Municipal de Narandiba</h4>
                            <p class="text-muted">Órgão Público</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 portfolio-item">
                        <a class="portfolio-link" data-toggle="modal" href="#modalUnoeste">
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
                        <a class="portfolio-link" data-toggle="modal" href="#modalPericia">
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
                        <a class="portfolio-link" data-toggle="modal" href="#modalEnergisa">
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
                        <a class="portfolio-link" data-toggle="modal" href="#modalMatville">
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
                        <a class="portfolio-link" data-toggle="modal" href="#modalOasis">
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
                        <a class="portfolio-link" data-toggle="modal" href="#modalPericia">
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

                    <div class="col-md-4 col-sm-6 portfolio-item">
                        <a class="portfolio-link" data-toggle="modal" href="#modalMandiovitta">
                            <div class="portfolio-hover">
                                <div class="portfolio-hover-content">
                                    <i class="fas fa-plus fa-3x"></i>
                                </div>
                            </div>
                            <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/mandiovitta-thumbnail.jpg"
                                 alt="">
                        </a>
                        <div class="portfolio-caption">
                            <h4>Farinha de Mandioca Mandiovitta</h4>
                            <p class="text-muted">Indústria</p>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 portfolio-item">
                        <a class="portfolio-link" data-toggle="modal" href="#modalIamada">
                            <div class="portfolio-hover">
                                <div class="portfolio-hover-content">
                                    <i class="fas fa-plus fa-3x"></i>
                                </div>
                            </div>
                            <img class="img-fluid" src="${pageContext.request.contextPath}/site/img/portfolio/iamada-thumbnail.jpg"
                                 alt="">
                        </a>
                        <div class="portfolio-caption">
                            <h4>Hospital Iamada Presidente Prudente - SP</h4>
                            <p class="text-muted">Hospital</p>
                        </div>
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
                                <a href="#">Política de privacidade</a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">Termos de uso</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Portfolio Modals -->

        <!-- Modal 1 -->
        <div class="portfolio-modal modal fade" id="modalIpiranga" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <p>Fomos responsáveis pela renovação de licença de operação junto à CETESB, Companhia
                                        Ambiental do Estado de São Paulo
                                        da base de combustível da IPIRANGA S/A, localizada no município de Presidente
                                        Prudente - SP. Além disso, monitoramos
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

        <div class="portfolio-modal modal fade" id="modalTenisClube" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">Tênis Clube de Presidente Prudente</h2>
                                    <p class="item-intro text-muted">Lazer</p>
                                    <p>Realizamos o levantamento topográfico cadastral para fins de atualização da planta
                                        do empreendimento e possível ampliação
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

        <div class="portfolio-modal modal fade" id="modalSupergasBras" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">SuperGasbras</h2>
                                    <p class="item-intro text-muted">Gás</p>
                                    <p>Fomos responsáveis pela obtenção da licença de operação junto à CETESB,
                                        Companhia Ambiental do Estado de São Paulo da unidade da SupergasBras em Teodoro
                                        Sampaio.
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

        <div class="portfolio-modal modal fade" id="modalMasterFivelas" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">Master Fivelas</h2>
                                    <p class="item-intro text-muted">Fivelas</p>
                                    <p>Fomos responsáveis pela renovação e ampliação de licença de operação junto à CETESB,
                                        indústria de
                                        galvanoplastia denominada Master Fivelas, localizada no município de Presidente
                                        Prudente - SP. Além disso,
                                        monitoramos o cumprimento das exigências técnicas contidas na licença de operação,
                                        inclusive da estação de tratamento de efluentes.
                                        Nossa equipe de Arquitetura elaborou o Estudo de Impacto de Vizinha - EIV para
                                        obtenção da Certidão de Uso do Solo expedida
                                        pela Prefeitura Municipal de Presidente Prudente. Esta certidão é um dos documentos
                                        necessários para o processo de licenciamento ambiental da indústria.
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

        <div class="portfolio-modal modal fade" id="modalMultibrasilSementes" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">Multibrasil Sementes</h2>
                                    <p class="item-intro text-muted">Sementes</p>
                                    <p>Somos responsáveis pelo tratamento de água do poço artesiano conforme a portaria
                                        2914/2011. Para isto, fazemos
                                        monitoramentos mensais da qualidade da água através de análise em laboratório
                                        acreditado pels ISO 17.025 e reconhecida pelo INMETRO.
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

        <div class="portfolio-modal modal fade" id="modalHospitalBernardes" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">Hospital de Presidente Bernardes</h2>
                                    <p class="item-intro text-muted">Saúde</p>                                
                                    <p>Nossa equipe de Engenharia Civil elaborou o projeto da ampliação da cozinha do hospital, bem como da reforma do telhado.
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

        <div class="portfolio-modal modal fade" id="modalUnoeste" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">Unoeste</h2>
                                    <p class="item-intro text-muted">Ensino Superior</p>                                
                                    <p>Realizamos o Cadastro Ambiental Rural - CAR de uma propriedade rural desta Universidade. O CAR está previsto 
                                        no Código Florestal Brasileiro, Lei 12.651/2012 e é exigido para todos os imóveis rurais, sem exceção.
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

        <div class="portfolio-modal modal fade" id="modalPericia" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">Perícia Ambiental de Pulverização Aérea de Agrotóxicos</h2>
                                    <p class="item-intro text-muted">Perícia Ambiental</p>                                
                                    <p>
                                        Participamos da equipe técnica responsável pelo estudo de deriva de agrotóxicos no município de Botucatu – SP. Este estudo serviu de suporte em ação judicial para quantificar os danos materiais provocados em uma lavoura de Pitaia em decorrência da deriva dos agrotóxicos de uma usina de açúcar e álcool.
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

        <div class="portfolio-modal modal fade" id="modalEnergisa" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">Grupo Energisa S/A</h2>
                                    <p class="item-intro text-muted">Energia Elétrica</p>                                
                                    <p>
                                        Temos um carinho especial por este nosso cliente. Foi nosso primeiro trabalho técnico desenvolvido pela Geoambiental Engenharia, na ocasião de 2015 quando fizemos uma avaliação pericial em uma APP atingida por incêndio e que prejudicou também as instalações elétricas da Energisa.
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

        <div class="portfolio-modal modal fade" id="modalMartville" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">Residencial Martiville – Presidente Prudente/SP</h2>
                                    <p class="item-intro text-muted">Residencial</p>                                
                                    <p>
                                        Solicitamos à CETESB a Licença de Operação do Empreendimento. Na época a CETESB não exigia a anuência do IPHAN. Atualmente, nos pedidos de LP, LP/LI ou LI, devem ser apresentados para abertura do processo na CETESB, a Ficha de Caracterização da Atividade – FCA, devidamente preenchida, na qual constem o número de informado pelo IPHAN e a data do protocolo. Ainda, para a emissão da LO, também deverá ser apresentado o Oficio ou Termo de Referência Especifico – TRE emitido pelo IPHAN com a anuência à emissão da LO.
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

        <div class="portfolio-modal modal fade" id="modalOasis" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">Condomínio Oásis do Paranapanema</h2>
                                    <p class="item-intro text-muted">Condomínio</p>                                
                                    <p>
                                        Ficamos responsáveis pelo tratamento de água do poço artesiano conforme a Portaria 2914/2011. Para isto, fazemos monitoramentos mensais da qualidade da água através de análise em laboratório acreditado pela ISO 17.025 e reconhecido pelo INMETRO.
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

        <div class="portfolio-modal modal fade" id="modalVistaVerde" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">Agropecuária Vista Verde</h2>
                                    <p class="item-intro text-muted">Agropecuária</p>                                
                                    <p>
                                        Prestamos serviço de consultoria ambiental completa, tais como licenciamento ambiental junto à CETESB, tratamento dos resíduos de baias de confinamento, tratamento de efluentes, tratamento de água subterrânea para consumo humano conforme estabelecido pela Portaria do Ministério da Saúde nº 2914/2011, entre outros.
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

        <div class="portfolio-modal modal fade" id="modalMandiovitta" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">Farinha de Mandioca Mandiovitta</h2>
                                    <p class="item-intro text-muted">Indústria</p>                                
                                    <p>
                                        Prestamos serviço de consultoria ambiental completa, tais como licenciamento ambiental junto à CETESB, tratamento dos resíduos, tratamento de efluentes, tratamento de água subterrânea para consumo humano conforme estabelecido pela Portaria do Ministério da Saúde nº 2914/2011, entre outros.
                                        Participamos de um período de transição desta indústria, onde foi transferida de Parapuã – SP para Martinópolis – SP. Como a CETESB licencia a unidade poluidora e não a empresa, tivemos que obter todas as licenças para o novo endereço, ou seja, Licença Prévia, Licença de Instalação e Licença de Operação. Este licenciamento ambiental marcou nossa trajetória na indústria, contribuiu para ampliar novos horizontes dentro da consultoria ambiental. Para nós é uma satisfação imensurável poder fazer parte do desenvolvimento da Mandiovitta.

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

        <div class="portfolio-modal modal fade" id="modalIamada" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2 class="text-uppercase">Hospital Iamada de Presidente Prudente - SP</h2>
                                    <p class="item-intro text-muted">Hospital</p>                                
                                    <p>
                                        Somos responsáveis por realizar o Licenciamento Ambiental do Hospital Iamada. Orientamos o hospital no que se refere ao armazenamento, coleta transporte e destinação final de resíduos perigosos oriundos do serviço de saúde.
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