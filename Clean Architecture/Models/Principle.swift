//
//  Principle.swift
//  Clean Architecture
//
//  Created by Alex Dearden on 28/01/2020.
//  Copyright © 2020 Alex Dearden. All rights reserved.
//

import Foundation

// TODO: Separate these into files accordingly

// Returns array of principles
protocol PrinciplesListable {
    func allPrinciples() -> [PrincipleConformable]
}

protocol PrincipleConformable {
    var title: String { get }
    var examples: [Example] { get set }
}

protocol ExampleConformable {
    var title: String { get }
    var description: String { get }
}


// MARK: Principle
struct Principle: PrincipleConformable {
    var title: String
    var examples: [Example]
    var order: Int
}

// MARK: Example
struct Example: ExampleConformable {
    var title: String
    var description: String
    var order: Int
}


// MARK: Principle Manager protocol
protocol PrincipleManageable: class {
    func createPrinciple(title: String, examples: [ExampleConformable])
    func updatePrinciple(principle: PrincipleConformable, title: String?, examples: [ExampleConformable]?) -> Bool
    func deletePrinciple(principle: PrincipleConformable) -> Bool
}

// MARK: Example Manager protocol
protocol ExampleManageable: class {
    func createExample(title: String, description: String) -> ExampleConformable
    func updateExample(example: ExampleConformable, title: String?, description: String) -> Bool
    func deleteExample(example: ExampleConformable) -> Bool
}


// MARK: Principle Manager
final class PrincipleManager {
    private var principles: [PrincipleConformable] = []
}

extension PrincipleManager: PrinciplesListable {
    func allPrinciples() -> [PrincipleConformable] {
        return principles
    }
}

extension PrincipleManager: PrincipleManageable {
    func createPrinciple(title: String, examples: [ExampleConformable] = []) {
        let newPrinciple = Principle(title: "Sample Principle", examples: [], order: 1)
        principles.append(newPrinciple)
    }

    func updatePrinciple(principle: PrincipleConformable, title: String?, examples: [ExampleConformable]?) -> Bool {
        return true
    }

    func deletePrinciple(principle: PrincipleConformable) -> Bool {
        guard let existingPrincipleIndex = principles.firstIndex(where: { $0.title == principle.title })  else {
            return false
        }

        principles.remove(at: existingPrincipleIndex)
        return true
    }
}

extension PrincipleManager: ExampleManageable {
    // NOTE: This might seem to be breaking SRP by doing more than one thing (managing Principle and Examples)...
    // but it conforms to the Common Reuse Principle:
    // classes with modules that tend to be used together, belong in the same component

    // Example Manager functions
    func createExample(title: String, description: String) -> ExampleConformable {
        return Example(title: "Sample example", description: "Not to be used in production", order: 1)
    }

    func updateExample(example: ExampleConformable, title: String?, description: String) -> Bool {
        return true
    }

    func deleteExample(example: ExampleConformable) -> Bool {
        return true
    }
}

