//
//  SheetType.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import SwiftUI

enum SheetType: Int, CaseIterable, Identifiable {
    case first, second, third, fourth, fifth, sixth

    var id: Int { rawValue }

    var buttonTitle: String {
        switch self {
        case .first: return "First View"
        case .second: return "Second View"
        case .third: return "Third View"
        case .fourth: return "Fourth View"
        case .fifth: return "Fifth View"
        case .sixth: return "Sixth View"
        }
    }

    var iconName: String {
        switch self {
        case .first: return "graduationcap.fill"
        case .second: return "pencil.circle.fill"
        case .third: return "globe"
        case .fourth: return "calendar"
        case .fifth: return "star.fill"
        case .sixth: return "briefcase.fill"
        }
    }

    var cardTitle: String {
        switch self {
        case .first: return "Aprendizaje"
        case .second: return "Tomar Test"
        case .third: return "Comunidad"
        case .fourth: return "Eventos"
        case .fifth: return "Casos Exitosos"
        case .sixth: return "Campo Laboral"
        }
    }

    var cardDescription: String {
        switch self {
        case .first: return "¡Descubre todo acerca de la ingeniería y las carreras más innovadoras de hoy en día que te pudieran interesar!"
        case .second: return "Realiza el test para evaluar tus conocimientos."
        case .third: return "Conecta con otras personas"
        case .fourth: return "Encuentra los eventos más innovadores que está sucediendo en tu estado"
        case .fifth: return "¡Conoce su historia! Las Ingenieras que revolucionaron el mundo."
        case .sixth: return "Aprende qué puedes realizar profesionalmente y donde ejercer tus conocimientos"
        }
    }

    var view: AnyView {
        switch self {
        case .first: return AnyView(LearningView())
        case .second: return AnyView(TestView())
        case .third: return AnyView(CommunityView())
        case .fourth: return AnyView(EventsView())
        case .fifth: return AnyView(SuccessStoriesView())
        case .sixth: return AnyView(JobMarketView())
        }
    }
}
