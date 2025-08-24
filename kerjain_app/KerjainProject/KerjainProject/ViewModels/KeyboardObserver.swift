//
//  KeyboardObserver.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 24/8/25.
//

import SwiftUI
import Combine

final class KeyboardObserver: ObservableObject {
    @Published var height: CGFloat = 0
    @Published var isVisible: Bool = false

    private var bag = Set<AnyCancellable>()

    init() {
        Publishers.Merge(
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification),
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        )
        .sink { [weak self] note in
            guard let self = self else { return }

            let end = (note.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) ?? .zero
            let screenH = UIScreen.main.bounds.height
            let isHidden = end.origin.y >= screenH || note.name == UIResponder.keyboardWillHideNotification

            // safe area bottom (home indicator) supaya gak “angkat” konten saat keyboard belum muncul
            let safeBottom = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
                .keyWindow?.safeAreaInsets.bottom ?? 0

            withAnimation(.easeOut(duration: 0.25)) {
                self.isVisible = !isHidden
                self.height = isHidden ? 0 : 130
            }
        }
        .store(in: &bag)
    }
}
