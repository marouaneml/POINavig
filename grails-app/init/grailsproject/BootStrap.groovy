package grailsproject

import mbds.grailsframework.poinavig.model.Loc
import mbds.grailsframework.poinavig.model.Media
import mbds.grailsframework.poinavig.model.Poi
import mbds.grailsframework.poinavig.model.PoiGroupe
import mbds.grailsframework.poinavig.springsec.Role
import mbds.grailsframework.poinavig.springsec.User
import mbds.grailsframework.poinavig.springsec.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = Role.findOrSaveWhere('authority': 'ROLE_ADMIN')
        def moderateurRole = Role.findOrSaveWhere('authority': 'ROLE_MODERATEUR')
        def userRole = Role.findOrSaveWhere('authority': 'ROLE_USER')
        def admin = User.findOrSaveWhere(username: 'admin', password: 'admin', dateCreated: new Date(2017,9,20), enabled: true)
        def moderateur = User.findOrSaveWhere(username: 'moderateur', password: 'moderateur', dateCreated: new Date(2017,9,14), enabled: true)
        def user = User.findOrSaveWhere(username: 'user', password: 'user', dateCreated: new Date(2017,10,1), enabled: true)

        fillDb(admin, moderateur)

        if (!admin.authorities.contains(adminRole)) {
            UserRole.create(admin, adminRole, true)
        }
        if (!moderateur.authorities.contains(moderateurRole)) {
            UserRole.create(moderateur, moderateurRole, true)
        }
        if (!user.authorities.contains(userRole)) {
            UserRole.create(user, userRole, true)
        }


        User.withSession { it.flush() }

    }

    def fillDb(User admin, User moderateur) {

        String path = 'uploads/images/poimedias/restaurants/'

        // Remplissage de la base de données

        def g1 = new PoiGroupe(user: admin).save(flush: true, failOnError: true)
        def g2 = new PoiGroupe(user: admin).save(flush: true, failOnError: true)
        def g3 = new PoiGroupe(user: moderateur).save(flush: true, failOnError: true)
        def g4 = new PoiGroupe(user: moderateur).save(flush: true, failOnError: true)
        def g5 = new PoiGroupe(user: admin).save(flush: true, failOnError: true)
        //creation des localisations
        def l1 = new Loc(name: '12 Rue Lascaris,Nice, France', lat: '43.6997761', lng: '7.28481').save(flush: true, failOnError: true)
        def l2 = new Loc(name: '5 Rue Colonna d\'Istria, 06300 Nice,France', lat: '43.6974194', lng: '7.273369').save(flush: true, failOnError: true)
        def l3 = new Loc(name: '11 Rue Grimaldi, 06000 Nice,France', lat: '43.6989375', lng: '7.2626582').save(flush: true, failOnError: true)
        def l4 = new Loc(name: '37 Rue Pastorelli, 06000 Nice,France', lat: '43.7002637', lng: '7.2680271').save(flush: true, failOnError: true)
        def l5 = new Loc(name: '17 Rue Smolett, 06300 Nice, France', lat: '43.7038442', lng: '7.2813982').save(flush: true, failOnError: true)
        def l6 = new Loc(name: '4 Rue Droite, 06300 Nice, France, 06300 Nice, France', lat: '43.6981402', lng: '7.2755344').save(flush: true, failOnError: true)
        def l7 = new Loc(name: '64 Boulevard Risso, 06300 Nice, France', lat: '43.7014786', lng: '7.2772037').save(flush: true, failOnError: true)
        def l8 = new Loc(name: '20 Cours Saleya, 06300 Nice, France', lat: '43.6954194', lng: '7.2731327').save(flush: true, failOnError: true)
        def l9 = new Loc(name: '13 Place Saint-François, 06300 Nice, France', lat: '43.69875', lng: '7.2760853').save(flush: true, failOnError: true)
        def l10 = new Loc(name: '1 Rue Molière, 06100 Nice, France', lat: '43.712981', lng: '7.2592023').save(flush: true, failOnError: true)
        def l11 = new Loc(name: '34 Rue Beaumont, 06300 Nice, France', lat: '43.7035358', lng: '7.2835738').save(flush: true, failOnError: true)
        def l12 = new Loc(name: '28 Rue d\'Angleterre, 06000 Nice, France', lat: '43.7049021', lng: '7.2626546').save(flush: true, failOnError: true)
        def l13 = new Loc(name: '5 Bis Rue Sainte-Reparate, 06300 Nice, France', lat: '43.6967937', lng: '7.2737594').save(flush: true, failOnError: true)

        //creattion des POIs
        def p1 = new Poi(localisation: l1, name: 'JAN', description: 'Ce restaurant offre une cuisine française moderne et inventive dans un cadre élégant aux accents baroques.')
                .addToPoiGroupes(g1)
                .save(flush: true, failOnError: true)
        def p2 = new Poi(localisation: l2, name: 'Marc de Café', description: 'Plats délicieux, personnel agréable, ambiance conviviale c\'est bel et bien au restaurant Ranita qu\'on se trouve')
                .addToPoiGroupes(g1)
                .addToPoiGroupes(g2)
                .save(flush: true, failOnError: true)
        def p3 = new Poi(localisation: l3, name: 'Le sejour café', description: 'Boire, manger, parler, se détendre. Au Séjour Café, plus qu\'une devise, c\'est un art de vivre.')
                .addToPoiGroupes(g2)
                .addToPoiGroupes(g3)
                .save(flush: true, failOnError: true)
        def p4 = new Poi(localisation: l4, name: 'Les Sens', description: 'Une cuisine élaborée avec des produits frais, de saison et attachée à Nice. Tout y est fait maison, même le pain !!!')
                .addToPoiGroupes(g1)
                .save(flush: true, failOnError: true)
        def p5 = new Poi(localisation: l5, name: 'Le Millésime', description: 'au cœur du vignoble de Bourgogne. Dans une authentique demeure de village pour un véritable voyage culinaire.')
                .addToPoiGroupes(g4)
                .addToPoiGroupes(g2)
                .save(flush: true, failOnError: true)
        def p6 = new Poi(localisation: l6, name: 'ILLIA PASTA', description: 'Pâtes faites à la main fraîches italiennes et bar café italien')
                .addToPoiGroupes(g3)
                .addToPoiGroupes(g5)
                .save(flush: true, failOnError: true)
        def p7 = new Poi(localisation: l7, name: 'Workhouse Cafe', description: 'une ambiance chaleureuse, développer votre réseau ou échanger autour d\'un bon café')
                .addToPoiGroupes(g1)
                .addToPoiGroupes(g5)
                .addToPoiGroupes(g2)
                .addToPoiGroupes(g4)
                .save(flush: true, failOnError: true)
        def p8 = new Poi(localisation: l8, name: 'Pop-o-Thym', description: 'Ce petit restaurant à l\'atmosphère décontractée et chaleureuse vous accueille pour un excellent brunch, à déguster en famille ou entre amis.')
                .addToPoiGroupes(g4)
                .addToPoiGroupes(g2)
                .save(flush: true, failOnError: true)
        def p9 = new Poi(localisation: l9, name: 'Creperie Le Trimaran', description: 'Restaurant près du vieux Nice, ou les galettes, les crepes, les salades et les omelettes sont élaborées à la minute prés à base de produits frais')
                .addToPoiGroupes(g3)
                .addToPoiGroupes(g1)
                .save(flush: true, failOnError: true)
        def p10 = new Poi(localisation: l10, name: 'La Route du Miam', description: 'Ce restaurant sert vins choisis et plats du Sud-Ouest, comme la canette farcie, dans une ambiance familiale.')
                .addToPoiGroupes(g1)
                .addToPoiGroupes(g2)
                .save(flush: true, failOnError: true)
        def p11 = new Poi(localisation: l11, name: 'La Roustide', description: 'Une cuisine provençale de saison, servie dans un cadre élégant et champêtre aux tons clairs, en beige et bois.')
                .addToPoiGroupes(g3)
                .addToPoiGroupes(g4)
                .save(flush: true, failOnError: true)
        def p12 = new Poi(localisation: l12, name: 'La Planxa', description: 'En plein centre ville de Nice, essayez un repas qui sort de l\'ordinaire au restaurant La Planxa qui revisite le concept de planches à partager !')
                .addToPoiGroupes(g5)
                .save(flush: true, failOnError: true)
        def p13 = new Poi(localisation: l13, name: 'Hobo Coffee', description: 'Boissons, Brunch, Petit déjeuner, Terrasse, Places assises, Plats à emporter; tout cela est bien plus au sein de ce chaleureux restaurant ')
                .addToPoiGroupes(g4)
                .save(flush: true, failOnError: true)

        //creation des medias
        def m1 = new Media(name: 'JAN', description: 'restaurant', url: path + '1.jpg', poi: p1).save(flush: true, failOnError: true)
        p1.addToMedias(m1)
        def m2 = new Media(name: 'Le sejour café', description: 'restaurant', url: path + '2.jpg', poi: p2).save(flush: true, failOnError: true)
        p2.addToMedias(m2)
        def m3 = new Media(name: 'Les Sens', description: 'restaurant', url: path + '3.jpg', poi: p3).save(flush: true, failOnError: true)
        p3.addToMedias(m3)
        def m4 = new Media(name: 'Le Millésime', description: 'restaurant', url: path + '4.jpg', poi: p4).save(flush: true, failOnError: true)
        p4.addToMedias(m4)
        def m5 = new Media(name: 'ILLIA PASTA', description: 'restaurant', url: path + '5.jpg', poi: p5).save(flush: true, failOnError: true)
        p5.addToMedias(m5)
        def m6 = new Media(name: 'Workhouse Cafe', description: 'restaurant', url: path + '6.jpg', poi: p6).save(flush: true, failOnError: true)
        p6.addToMedias(m6)
        def m7 = new Media(name: 'Pop-o-Thym', description: 'restaurant', url: path + '7.jpg', poi: p7).save(flush: true, failOnError: true)
        p7.addToMedias(m7)
        def m8 = new Media(name: 'Creperie Le Trimaran', description: 'restaurant', url: path + '8.jpg', poi: p8).save(flush: true, failOnError: true)
        p8.addToMedias(m8)
        def m9 = new Media(name: 'La Route du Miam', description: 'restaurant', url: path + '9.jpg', poi: p9).save(flush: true, failOnError: true)
        p9.addToMedias(m9)
        def m10 = new Media(name: 'La Roustide', description: 'restaurant', url: path + '10.jpg', poi: p10).save(flush: true, failOnError: true)
        p10.addToMedias(m10)
        def m11 = new Media(name: 'La Planxa', description: 'restaurant', url: path + '11.jpg', poi: p11).save(flush: true, failOnError: true)
        p11.addToMedias(m11)
        def m12 = new Media(name: 'Hobo Coffee', description: 'restaurant', url: path + '12.jpg', poi: p12).save(flush: true, failOnError: true)
        p12.addToMedias(m12)
        def m13 = new Media(name: 'Marc de Café', description: 'restaurant', url: path + '13.jpg', poi: p13).save(flush: true, failOnError: true)
        p13.addToMedias(m13)

    }
    def destroy = {
    }
}
